#/bin/bash

cd  android-sdk-linux
 yum install java-1.8.0-openjdk-devel.x86_64 
# sudo apt-get update
# sudo apt-get install openjdk-8-jdk
java -version
curl -O https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip sdk-tools-linux-4333796.zip
localpath=`pwd`
export ANDROID_HOME=$localpath
export PATH=${ANDROID_HOME}/tools/bin:$PATH
echo $ANDROID_HOME
sdkmanager --version
sdkmanager --install "build-tools;20.1.0" "build-tools;28.0.3" "platforms;android-28"
