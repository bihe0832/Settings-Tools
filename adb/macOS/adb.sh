#!/bin/sh
# author hardyshi

echo "********APK build init set env *******"
localPath=$(pwd)

echo "localPath:"$localPath

${localPath}/adb version

${localPath}/adb version > ${localPath}/logcat.log

echo "开始抓取日志，请操作完以后使用 Ctrl + C  中断，然后提交:${localPath}/logcat.log 给开发者"

${localPath}/adb logcat -v time >> ${localPath}/logcat.log