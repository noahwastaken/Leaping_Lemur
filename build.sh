#!/bin/bash

# Colorize and add text parameters
red=$(tput setaf 1)             #  red
grn=$(tput setaf 2)             #  green
cya=$(tput setaf 6)             #  cyan
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
bldcya=${txtbld}$(tput setaf 6) #  cyan
txtrst=$(tput sgr0)             # Reset

# Get Build Startup Time
if [ -z "$OUT_TARGET_HOST" ]
then
   res1=$(date +%s.%N)
else
   res1=$(gdate +%s.%N)
fi

# Path to build your kernel
  k=~/lemur
# Directory for the any kernel updater
  t=$k/packages
# Date to add to zip
  today=$(date +"%m%d%Y")

# Clean Kernel
   echo "${bldcya}Clean ${bldcya}Kernel${txtrst}"
     make clean

# Clean old builds
   echo "${bldred}Clean ${bldred}Out ${bldred}Folder${txtrst}"
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

TOOLCHAIN=/home/tal/custom-gcc-kernel-toolchains/arm-cortex_a15/arm-cortex_a15-linux-gnueabihf-linaro_4.9.1-2014.05/bin/arm-cortex_a15-linux-gnueabihf-
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
   echo "<<>><<>> ${bldred}Collecting ${bldred}modules ${bldred}and ${bldred}zimage${txtrst} <<>><<>>"
   echo ""
   cp $k/arch/arm/boot/zImage out/$c/boot/lemur.zImage
   for mo in $(find . -name "*.ko"); do
		cp "${mo}" $m
   done

# Build Zip
 clear
   echo "${bldcya}Creating ${bldcya}$z.zip${txtrst}"

# Version Number to add to zip
   echo "${bldblu}Version ${bldblu}Number${txtrst}"
VERSION=$(cat '.version')
  z=$c-"r${VERSION}"-$today
     cd $k/out/$c/
       7z a "$z.zip"
         mv $z.zip $k/out/$z.zip

# cp $k/out/$z.zip $db/$z.zip
#           rm -rf $k/out/$c
# Line below for debugging purposes,  uncomment to stop script after each config is run
#read this
      done

# Get Build Time
if [ -z "$OUT_TARGET_HOST" ]
then
   res2=$(date +%s.%N)
else
   res2=$(gdate +%s.%N)
fi

echo "${bldgrn}Total ${bldblu}time ${bldred}elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
echo "************************************************************************"
echo "${bldylw}${bldred}Build ${bldcya}Numba ${bldblu}${VERSION} ${txtrst}"
echo "${bldylw}${bldred}My ${bldcya}Kernels ${bldblu}Build ${bldred}Fast${txtrst}"
echo "************************************************************************"

