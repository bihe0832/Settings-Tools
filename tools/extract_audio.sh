#!/bin/bash
# extract_audio.sh - 批量提取视频音频为 MP3
# 交互式工具：运行后自动引导输入视频目录、输出目录、冲突处理方式

set -o pipefail

# ===== 颜色定义 =====
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ===== 视频格式列表 =====
VIDEO_EXTS="mp4 mkv avi mov flv wmv webm ts m4v"

# ===== 日志函数 =====
log_info()  { printf "${GREEN}[OK]${NC}   %s\n" "$1"; }
log_warn()  { printf "${YELLOW}[SKIP]${NC} %s\n" "$1"; }
log_error() { printf "${RED}[FAIL]${NC} %s\n" "$1"; }
log_title() { printf "\n${BOLD}${CYAN}%s${NC}\n" "$1"; }

# ===== 检查 ffmpeg =====
check_deps() {
    if ! command -v ffmpeg >/dev/null 2>&1; then
        log_error "未找到 ffmpeg，请先安装："
        printf "  brew install ffmpeg\n"
        exit 1
    fi
}

# ===== 清理拖拽路径（macOS Terminal 拖拽时会添加转义反斜杠） =====
clean_path() {
    local p="$1"
    # 去掉尾部空格和斜杠
    p=$(echo "$p" | sed 's/\\//g; s/ *$//; s|/$||')
    echo "$p"
}

# ===== 交互式收集输入 =====
ask_inputs() {
    log_title "=== 视频音频提取工具 ==="
    printf "\n"

    # 问题 1：视频目录
    printf "${BOLD}视频文件所在目录${NC}（回车默认当前目录）: "
    read -r input_dir
    if [ -z "$input_dir" ]; then
        VIDEO_DIR="."
    else
        VIDEO_DIR=$(clean_path "$input_dir")
    fi

    # 验证目录
    if [ ! -d "$VIDEO_DIR" ]; then
        log_error "目录不存在: $VIDEO_DIR"
        exit 1
    fi
    # 规范化为绝对路径
    VIDEO_DIR=$(cd "$VIDEO_DIR" && pwd)

    # 问题 2：输出目录
    printf "${BOLD}MP3 输出目录${NC}（回车默认与视频同目录）: "
    read -r output_dir
    if [ -z "$output_dir" ]; then
        OUTPUT_DIR="$VIDEO_DIR"
    else
        OUTPUT_DIR=$(clean_path "$output_dir")
    fi

    # 输出目录不存在则创建
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir -p "$OUTPUT_DIR" || { log_error "无法创建输出目录: $OUTPUT_DIR"; exit 1; }
    fi
    OUTPUT_DIR=$(cd "$OUTPUT_DIR" && pwd)

    # 问题 3：冲突处理
    printf "${BOLD}已存在同名 MP3 文件时${NC}：1) 覆盖  2) 跳过  （回车默认覆盖）: "
    read -r conflict_choice
    case "$conflict_choice" in
        2) EXIST_MODE="skip" ;;
        *) EXIST_MODE="overwrite" ;;
    esac

    printf "\n"
}

# ===== 扫描视频文件 =====
collect_files() {
    TMP_DIR=$(mktemp -d)
    FILE_LIST="$TMP_DIR/files.txt"
    STATS_SUCCESS="$TMP_DIR/success"
    STATS_SKIPPED="$TMP_DIR/skipped"
    STATS_FAILED="$TMP_DIR/failed"
    FAILED_LOG="$TMP_DIR/failed.log"
    mkdir -p "$STATS_SUCCESS" "$STATS_SKIPPED" "$STATS_FAILED"

    # 清理临时目录
    trap 'rm -rf "$TMP_DIR"' EXIT INT TERM

    # 构建 find 表达式
    local find_expr=""
    local first=true
    for ext in $VIDEO_EXTS; do
        if $first; then
            find_expr="-iname \"*.$ext\""
            first=false
        else
            find_expr="$find_expr -o -iname \"*.$ext\""
        fi
    done

    # 执行 find
    eval "find \"$VIDEO_DIR\" -maxdepth 1 -type f \\( $find_expr \\)" | sort > "$FILE_LIST"

    FILE_COUNT=$(wc -l < "$FILE_LIST" | tr -d ' ')
}

# ===== 单文件转换函数（供 xargs 子进程调用） =====
convert_one() {
    local video="$1"
    local filename
    filename=$(basename "$video")
    local name_no_ext="${filename%.*}"
    local output_file="$OUTPUT_DIR/${name_no_ext}.mp3"

    # 冲突检查
    if [ -f "$output_file" ]; then
        if [ "$EXIST_MODE" = "skip" ]; then
            printf "\033[0;33m[SKIP]\033[0m %s (已存在)\n" "$filename"
            touch "$STATS_SKIPPED/$(echo "$video" | md5 -q 2>/dev/null || echo "$$_$RANDOM")"
            return 0
        fi
        # overwrite 模式：ffmpeg -y 会处理
    fi

    # 执行转换
    if ffmpeg -y -i "$video" -vn -acodec libmp3lame -q:a 2 "$output_file" </dev/null >/dev/null 2>&1; then
        printf "\033[0;32m[OK]\033[0m   %s -> %s\n" "$filename" "${name_no_ext}.mp3"
        touch "$STATS_SUCCESS/$(echo "$video" | md5 -q 2>/dev/null || echo "$$_$RANDOM")"
    else
        printf "\033[0;31m[FAIL]\033[0m %s\n" "$filename"
        touch "$STATS_FAILED/$(echo "$video" | md5 -q 2>/dev/null || echo "$$_$RANDOM")"
        echo "$video" >> "$FAILED_LOG"
    fi
}

# ===== 统计汇总 =====
print_summary() {
    local success_count
    local skipped_count
    local failed_count
    success_count=$(find "$STATS_SUCCESS" -type f 2>/dev/null | wc -l | tr -d ' ')
    skipped_count=$(find "$STATS_SKIPPED" -type f 2>/dev/null | wc -l | tr -d ' ')
    failed_count=$(find "$STATS_FAILED" -type f 2>/dev/null | wc -l | tr -d ' ')

    local end_time
    end_time=$(date +%s)
    local elapsed=$(( end_time - START_TIME ))
    local mins=$(( elapsed / 60 ))
    local secs=$(( elapsed % 60 ))

    log_title "=== 转换完成 ==="
    printf "  总文件: ${BOLD}%d${NC}\n" "$FILE_COUNT"
    printf "  ${GREEN}成功: %d${NC}\n" "$success_count"
    if [ "$skipped_count" -gt 0 ]; then
        printf "  ${YELLOW}跳过: %d${NC}\n" "$skipped_count"
    fi
    if [ "$failed_count" -gt 0 ]; then
        printf "  ${RED}失败: %d${NC}\n" "$failed_count"
        printf "\n  失败文件:\n"
        while IFS= read -r f; do
            printf "    - %s\n" "$(basename "$f")"
        done < "$FAILED_LOG"
    fi
    printf "  耗时: %d 分 %d 秒\n\n" "$mins" "$secs"
}

# ===== 主流程 =====
main() {
    check_deps
    ask_inputs
    collect_files

    if [ "$FILE_COUNT" -eq 0 ]; then
        log_error "在 $VIDEO_DIR 中未找到视频文件"
        exit 0
    fi

    # 任务摘要
    log_title "=== 开始转换 ==="
    printf "  视频目录: %s\n" "$VIDEO_DIR"
    printf "  输出目录: %s\n" "$OUTPUT_DIR"
    printf "  冲突处理: %s\n" "$([ "$EXIST_MODE" = "skip" ] && echo "跳过" || echo "覆盖")"
    printf "  文件数量: %d\n" "$FILE_COUNT"

    # 并发数 = CPU 核心数 / 2（最小 1）
    local jobs
    jobs=$(( $(sysctl -n hw.ncpu 2>/dev/null || echo 4) / 2 ))
    [ "$jobs" -lt 1 ] && jobs=1
    printf "  并发数量: %d\n\n" "$jobs"

    START_TIME=$(date +%s)

    # 导出子进程需要的变量和函数
    export OUTPUT_DIR EXIST_MODE STATS_SUCCESS STATS_SKIPPED STATS_FAILED FAILED_LOG
    export -f convert_one

    # 并发执行
    cat "$FILE_LIST" | xargs -P "$jobs" -I {} bash -c 'convert_one "$@"' _ {}

    print_summary
}

main
