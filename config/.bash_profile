ANDROID_HOME=/usr/local/android-sdk
export ANDROID_HOME

ANDROIDNDK_LINUX_R9C=/usr/local/android-ndk-r9c
export ANDROIDNDK_LINUX_R9C

ANDROID_NDK_CMD=/usr/local/android-ndk-r9c/ndk-build
export ANDROID_NDK_CMD

export PATH=${PATH}:/usr/local/android-sdk/platform-tools:$ANDROID_HOME:$ANDROIDNDK_LINUX_R9C:$ANDROID_NDK_CMD
