@ECHO OFF
color 2
echo.
echo ************************************************
echo *      欢迎使用腾讯移动游戏日志提交工具。      *
echo ************************************************
echo 使用方法：
echo 	1. 选择QQ号与腾讯移动游戏开发交流，由于是临时会话，会提示加好友。
echo 	2. 加好友以后，再次点击点击与开发交流，就能聊天传送文件。
echo 注意事项：
echo 	1. 由于临时回话无法发送文件，你可以先添加开发为好友，然后再次点击这个工具发起聊天，发送文件给开发。
set QQ=2481808018
start tencent://message/^?Menu^=yes^&uin^=%QQ%^&Site^=planeart.cn^&Service^=300^&sigT^=45a1e5847943b64c6ff3990f8a9e644d2b31356cb0b4ac6b24663a3c8dd0f8aa12a595b1714f9d45
echo 十分感谢，按任意键退出 & pause>nul