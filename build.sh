#!/bin/bash

# Path to build your kernel
  k=~/lemur
# Directory for the any kernel updater
  t=$k/packages
# Date to add to zip
  today=$(date +"%m%d%Y")

# Clean Kernel
   echo "Clean Kernel"
     make clean

# Clean old builds
   echo "Clean"
     rm -rf $k/out
#     make clean

# Setup the build
 cd $k/arch/arm/configs/Lemurconfigs
    for c in *
      do
        cd $k
# Setup output directory
       mkdir -p "out/$c"
          cp -R "$t/system" out/$c
          cp -R "$t/META-INF" out/$c
	  cp -R "$t/boot" out/$c
	  cp -R "$t/config" out/$c
	  cp -R "$t/l2m" out/$c
	  cp -R "$t/no_l2m" out/$c
       mkdir -p "out/$c/system/lib/modules/"

  m=$k/out/$c/system/lib/modules
  z=$c-$today

TOOLCHAIN=/home/tal/custom-gcc-kernel-toolchains/arm-eabi/arm-eabi-4.10/bin/arm-eabi-
export ARCH=arm
export SUBARCH=arm

# make mrproper
#make CROSS_COMPILE=$TOOLCHAIN -j`grep 'processor' /proc/cpuinfo | wc -l` mrproper
 
# remove backup files
find ./ -name '*~' | xargs rm
# rm compile.log

# make kernel
make 'lemur_defconfig'
make -j`grep 'processor' /proc/cpuinfo | wc -l` CROSS_COMPILE=$TOOLCHAIN #>> compile.log 2>&1 || exit -1

# Grab modules & zImage
   echo ""
   echo "<<>><<>>  Collecting modules and zimage <<>><<>>"
   echo ""
   cp $k/arch/arm/boot/zImage out/$c/boot/lemur.zImage
   for mo in $(find . -name "*.ko"); do
		cp "${mo}" $m
   done

# Build Zip
 clear
   echo "Creating $z.zip"
     cd $k/out/$c/
       7z a "$z.zip"
         mv $z.zip $k/out/$z.zip
# cp $k/out/$z.zip $db/$z.zip
#           rm -rf $k/out/$c
# Line below for debugging purposes,  uncomment to stop script after each config is run
#read this
      done
