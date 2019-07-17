#/bin/bash

# i=4

# while(($i>0))

# do
# 	i=$(($i-1))
# 	adb shell input tap 1000 2100 && sleep 2 && adb shell input tap 100 200
# done

# echo "Finished restart \n"

# adb shell am force-stop com.tencent.tmgp.yybtestsdk && sleep 2 && adb shell am start -n com.tencent.tmgp.yybtestsdk/com.tencent.tmgp.yybtestsdk.MainActivity && sleep 8


i=10000

while(($i>0))

do
	i=$(($i-1))
QQ登陆
	echo "Next Action:QQ登陆"
	adb shell input tap 200 400
	echo "Next Action:QQ登陆确认" && sleep 15
#QQ登陆确认
	adb shell input tap 1000 1900
	echo "Next Action:获取个人信息" && sleep 2
# #获取个人信息
	adb shell input tap 800 2150
	echo "Next Action:返回" && sleep 5 
#返回
	adb shell input tap 100 200
	echo "Next Action:退出程序" && sleep 2
#退出程序
	adb shell am force-stop com.tencent.tmgp.yybtestsdk
	echo "Next Action:重新启动" && sleep 15
#重新启动
	adb shell am start -n com.tencent.tmgp.yybtestsdk/com.tencent.tmgp.yybtestsdk.MainActivity
	echo "Next Action:获取个人信息" && sleep 15
#获取个人信息
	adb shell input tap 800 2150 
	echo "Next Action:退出程序" && sleep 2
#返回
	adb shell input tap 100 200
	echo "Next Action:注销" && sleep 2
#注销
	adb shell input tap 1000 600
	echo "Next Action:微信登陆" && sleep 2
#微信登陆
	adb shell input tap 1000 400
	echo "Next Action:微信登陆确认" && sleep 15
#微信登陆确认
	adb shell input tap 1000 1400 
	echo "Next Action:获取个人信息" && sleep 15
#获取个人信息
	adb shell input tap 800 2150 
	echo "Next Action:返回" && sleep 2 
#返回
	adb shell input tap 100 200
	echo "Next Action:退出程序" && sleep 2
#退出程序
	adb shell am force-stop com.tencent.tmgp.yybtestsdk
	echo "Next Action:重新启动" && sleep 15
#重新启动
	adb shell am start -n com.tencent.tmgp.yybtestsdk/com.tencent.tmgp.yybtestsdk.MainActivity
	echo "Next Action:获取个人信息" && sleep 15
#获取个人信息
	adb shell input tap 800 2150 
	echo "Next Action:退出程序" && sleep 2
#返回
	adb shell input tap 100 200
	echo "Next Action:注销" && sleep 2
#注销
	adb shell input tap 1000 600
	sleep 2
done
