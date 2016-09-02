#!/bin/bash

export ARCH=arm
export CROSS_COMPILE="/home/ultimatum163/cm-12.1-source/prebuilts/gcc/linux-x86/arm/arm-cortex_a15-linux-gnueabihf-linaro_4.9/bin/arm-cortex_a15-linux-gnueabihf-"


make nx507j-nubiaui_defconfig
make -j4

make INSTALL_MOD_STRIP=--strip-unneeded INSTALL_MOD_PATH=out/system INSTALL_MOD_DIR=out/system android_modules_install

./dtbToolCM --force-v2 -o ./out/dt.img -s 2048 -p ./scripts/dtc/ ./arch/arm/boot/

cp ./arch/arm/boot/zImage ./out/zImage

