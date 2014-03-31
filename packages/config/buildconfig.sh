#!/sbin/sh

#Build config file
CONFIGFILE="/tmp/lemur.conf"

#L2M
L2M=`grep "item.0.1" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Logo2Menu Settings #####\n# 0 to disable logo2menu" >> $CONFIGFILE
echo -e "# 1 to enable logo2menu\n" >> $CONFIGFILE
if [ $L2M = 1 ]; then
  echo "LOGO2MENU=1" >> $CONFIGFILE;
else
  echo "LOGO2MENU=0" >> $CONFIGFILE;
fi

#BLN
BLN=`grep "item.0.2" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### BLN Settings ######\n# 1 to enable button light notification\n# 0 to disable button light notification\n" >> $CONFIGFILE
if [ $BLN = 1 ]; then
  echo "BLN=1" >> $CONFIGFILE;
else
  echo "BLN=0" >> $CONFIGFILE;
fi

#S2W
S2W=`grep "item.0.1" /tmp/aroma/sw.prop | cut -d '=' -f2`
S2S=`grep "item.0.2" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2Wake Settings #####\n# 0 to disable sweep2wake" >> $CONFIGFILE
echo -e "# 1 to enable sweep2wake and sweep2sleep (default)\n# 2 to enable sweep2sleep and disable sweep2wake\n" >> $CONFIGFILE
if [ $S2W = 1 ]; then
  echo "SWEEP2WAKE=1" >> $CONFIGFILE;
elif [ $S2S = 1 ]; then
  echo "SWEEP2WAKE=2" >> $CONFIGFILE;
else
  echo "SWEEP2WAKE=0" >> $CONFIGFILE;
fi

#DT2W
DT2W=`grep "item.0.3" /tmp/aroma/sw.prop | cut -d '=' -f2`
DT2WF=`grep "item.0.4" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### DoubleTap2Wake Settings #####\n# 0 to disable DoubleTap2Wake" >> $CONFIGFILE
echo -e "# 1 to enable DoubleTap2Wake\n# 2 to enable DoubleTap2Wake fullscreen\n" >> $CONFIGFILE
if [ $DT2W = 1 ]; then
  echo "DT2WAKE=1" >> $CONFIGFILE;
elif [ $DT2WF = 1 ]; then
  echo "DT2WAKE=2" >> $CONFIGFILE;
else
  echo "DT2WAKE=0" >> $CONFIGFILE;
fi

#L2W
L2W=`grep "item.0.5" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### Logo2Wake Settings #####\n# 0 to disable Logo2Wake" >> $CONFIGFILE
echo -e "# 1 to enable Logo2Wake\n" >> $CONFIGFILE
if [ $L2W = 1 ]; then
  echo "LOGO2WAKE=1" >> $CONFIGFILE;
else
  echo "LOGO2WAKE=0" >> $CONFIGFILE;
fi

#P2W
P2W=`grep "item.0.6" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### Pick2Wake Settings #####\n# 0 to disable Pick2Wake" >> $CONFIGFILE
echo -e "# 1 to enable Pick2Wake\n" >> $CONFIGFILE
if [ $P2W = 1 ]; then
  echo "PICK2WAKE=1" >> $CONFIGFILE;
else
  echo "PICK2WAKE=0" >> $CONFIGFILE;
fi

#F2W
F2W=`grep "item.0.7" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### Flick2Wake Settings #####\n# 0 to disable flick2wake" >> $CONFIGFILE
echo -e "# 1 to enable Flick2Wake\n" >> $CONFIGFILE
if [ $F2W = 1 ]; then
  echo "FLICK2WAKE=1" >> $CONFIGFILE;
else
  echo "FLICK2WAKE=0" >> $CONFIGFILE;
fi

#F2S
F2S=`grep "item.0.8" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### Flick2Sleep Settings #####\n# 0 to disable flick2sleep" >> $CONFIGFILE
echo -e "# 1 to enable Flick2Sleep\n" >> $CONFIGFILE
if [ $F2S = 1 ]; then
  echo "FLICK2SLEEP=1" >> $CONFIGFILE;
else
  echo "FLICK2SLEEP=0" >> $CONFIGFILE;
fi

#Pocket detection
POCKET=`grep "item.0.9" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### Pocket Detection Settings #####\n# 0 to disable pocket detection" >> $CONFIGFILE
echo -e "# 1 to enable pocket detection(default)\n" >> $CONFIGFILE
if [ $POCKET = 1 ]; then
  echo "POCKET=1" >> $CONFIGFILE;
else
  echo "POCKET=0" >> $CONFIGFILE;
fi

#VIBRATION
VIB=`cat /tmp/aroma/vibrate.prop | cut -d '=' -f2`
echo -e "\n\n##### Vibration Settings #####\n# 0 to disable vibration" >> $CONFIGFILE
echo -e "# 1 for default vibration\n# 2 for stronger vibration\n" >> $CONFIGFILE
if [ $VIB = 1 ]; then
  echo "VIB=0" >> $CONFIGFILE;
elif [ $VIB = 3 ]; then
  echo "VIB=2" >> $CONFIGFILE;
else
  echo "VIB=1" >> $CONFIGFILE;
fi

#FASTCHARGE
FC=`grep "item.0.3" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Fastcharge Settings ######\n# 1 to enable usb fastcharge\n# 0 to disable usb fastcharge\n" >> $CONFIGFILE
if [ $FC = 1 ]; then
  echo "FC=1" >> $CONFIGFILE;
else
  echo "FC=0" >> $CONFIGFILE;
fi

#COLOR ENHANCE
CE=`grep "item.0.4" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### HTC Color Enhancement settings ######\n# 1 to enable HTC color enhancement (default)\n# 0 to disable HTC color enhancement\n" >> $CONFIGFILE
if [ $CE = 1 ]; then
  echo "COLOR_ENHANCE=0" >> $CONFIGFILE;
else
  echo "COLOR_ENHANCE=1" >> $CONFIGFILE;
fi

#Graphics Boost
GBOOST=`grep "item.0.5" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Graphics Boost Settings ######\n# 1 to enable\n# 0 to disable\n" >> $CONFIGFILE
if [ $GBOOST = 0 ]; then
  echo "GBOOST=0" >> $CONFIGFILE;
else
  echo "GBOOST=1" >> $CONFIGFILE;
fi

#exFAT module
EXFAT=`grep "item.0.7" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### exFAT Settings ######\n# 1 to enable exFAT support\n# 0 to disable\n" >> $CONFIGFILE
if [ $EXFAT = 1 ]; then
  echo "EXFAT=1" >> $CONFIGFILE;
else
  echo "EXFAT=0" >> $CONFIGFILE;
fi

#Optimized Bionic Libraries
BIONIC=`grep "item.0.8" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Bionic Libraries ######\n# 1 to Optimized Bionic Libraries\n# 0 to disable\n" >> $CONFIGFILE
if [ $EXFAT = 1 ]; then
  echo "BIONIC=1" >> $CONFIGFILE;
else
  echo "BIONIC=0" >> $CONFIGFILE;
fi

#Dynamic Fsync
DYN_FSYNC=`grep "item.0.9" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Dynamic Fsync ######\n# 1 to enable Dynamic Fsync \n# 0 to disable Dynamic Fsync\n" >> $CONFIGFILE
if [ $DYN_FSYNC = 1 ]; then
  echo "DYN_FSYNC=1" >> $CONFIGFILE;
else
  echo "DYN_FSYNC=0" >> $CONFIGFILE;
fi

#GPU OC
GPU_OC=`cat /tmp/aroma/gpu.prop | cut -d '=' -f2`
echo -e "\n\n##### GPU Settings ######\n#values:  410 450 477 491 504 531 558 585\n#These cannot be applied if you selected stock GPU frequency during installation\n" >> $CONFIGFILE
if [ $GPU_OC = 2 ]; then
  echo "GPU_OC=410" >> $CONFIGFILE;
elif [ $GPU_OC = 3 ]; then
  echo "GPU_OC=450" >> $CONFIGFILE;
elif [ $GPU_OC = 4 ]; then
  echo "GPU_OC=477" >> $CONFIGFILE;
elif [ $GPU_OC = 5 ]; then
  echo "GPU_OC=491" >> $CONFIGFILE;
elif [ $GPU_OC = 6 ]; then
  echo "GPU_OC=504" >> $CONFIGFILE;
elif [ $GPU_OC = 7 ]; then
  echo "GPU_OC=531" >> $CONFIGFILE;
elif [ $GPU_OC = 8 ]; then
  echo "GPU_OC=558" >> $CONFIGFILE;
elif [ $GPU_OC = 9 ]; then
  echo "GPU_OC=585" >> $CONFIGFILE;
else
  echo "GPU_OC=0" >> $CONFIGFILE;
fi

#THERMAL
THERM=`cat /tmp/aroma/thermal.prop | cut -d '=' -f2`
echo -e "\n\n##### Thermal Settings #####\n# 0 for default thremal throttling" >> $CONFIGFILE
echo -e "# 1 to run cool\n# 2 to run extra cool\n# 3 to run hot\n" >> $CONFIGFILE
if [ $THERM = 1 ]; then
  echo "THERM=2" >> $CONFIGFILE;
elif [ $THERM = 2 ]; then
  echo "THERM=1" >> $CONFIGFILE;
elif [ $THERM = 4 ]; then
  echo "THERM=3" >> $CONFIGFILE;
else
  echo "THERM=0" >> $CONFIGFILE;
fi

#MPDECISION
MPDEC=`cat /tmp/aroma/mpdec.prop | cut -d '=' -f2`
echo -e "\n\n##### Mpdecision Settings #####\n# 0 for default settings" >> $CONFIGFILE
echo -e "# 1 for battery saving\n# 2 for performance\n" >> $CONFIGFILE
if [ $MPDEC = 1 ]; then
  echo "MPDEC=1" >> $CONFIGFILE;
elif [ $MPDEC = 3 ]; then
  echo "MPDEC=2" >> $CONFIGFILE;
else
  echo "MPDEC=0" >> $CONFIGFILE;
fi

#GPU Governor
GPU_GOV=`cat /tmp/aroma/gpugov.prop | cut -d '=' -f2`
echo -e "\n\n##### GPU Governor #####\n# 1 Ondemand (default)" >> $CONFIGFILE
echo -e "\n# 2 Simple\n# 3 Performance\n" >> $CONFIGFILE
if [ $GPU_GOV = 2 ]; then
  echo "GPU_GOV=2" >> $CONFIGFILE;
else
  echo "GPU_GOV=1" >> $CONFIGFILE;
fi

#i/o scheduler
SCHED=`cat /tmp/aroma/disk.prop | cut -d '=' -f2`
echo -e "\n\n##### i/o Scheduler #####\n# 1 CFQ (stock)" >> $CONFIGFILE
echo -e "# 2 ROW (default)\n# 3 DEADLINE\n# 4 FIOPS\n# 5 SIO\n# 6 BFQ\n# 7 ZEN\n# 8 VR\n# 9 NOOP\n" >> $CONFIGFILE
if [ $SCHED = 1 ]; then
  echo "SCHED=1" >> $CONFIGFILE;
elif [ $SCHED = 2 ]; then
  echo "SCHED=2" >> $CONFIGFILE;
elif [ $SCHED = 3 ]; then
  echo "SCHED=3" >> $CONFIGFILE;
elif [ $SCHED = 4 ]; then
  echo "SCHED=4" >> $CONFIGFILE;
elif [ $SCHED = 5 ]; then
  echo "SCHED=5" >> $CONFIGFILE;
elif [ $SCHED = 6 ]; then
  echo "SCHED=6" >> $CONFIGFILE;
elif [ $SCHED = 7 ]; then
  echo "SCHED=7" >> $CONFIGFILE;
elif [ $SCHED = 8 ]; then
  echo "SCHED=8" >> $CONFIGFILE;
elif [ $SCHED = 9 ]; then
  echo "SCHED=9" >> $CONFIGFILE;
fi

#Readahead buffer size
READAHEAD=`cat /tmp/aroma/disk2.prop | cut -d '=' -f2`
echo -e "\n\n##### Readahead Buffer Size #####\n# 512 (stock)" >> $CONFIGFILE
echo -e "# 1024\n# 2048\n# 4096\n" >> $CONFIGFILE
if [ $READAHEAD = 1 ]; then
  echo "READAHEAD=512" >> $CONFIGFILE;
elif [ $READAHEAD = 2 ]; then
  echo "READAHEAD=1024" >> $CONFIGFILE;
elif [ $READAHEAD = 3 ]; then
  echo "READAHEAD=2048" >> $CONFIGFILE;
elif [ $READAHEAD = 4 ]; then
  echo "READAHEAD=4096" >> $CONFIGFILE;
fi

#CPU Governor
CPU_GOV=`cat /tmp/aroma/cpugov.prop | cut -d '=' -f2`
echo -e "\n\n##### CPU Governor #####\n# 1 ondemand (default)" >> $CONFIGFILE
echo -e "\n# 2 abyssplugv2\n# 3 asswax\n# 4 badass\n# 5 dancedance\n# 6 darkness\n# 7 intellidemand\n# 8 intelliactive\n# 9 interactivex2\n# 10 lagfree\n# 11 lionheart\n# 12 smartass2\n# 13 smartassH3\n# 14 smartmax\n# 15 savagedzen\n# 16 wheatley\n" >> $CONFIGFILE
if [ $CPU_GOV = 2 ]; then
  echo "CPU_GOV=2" >> $CONFIGFILE;
elif [ $CPU_GOV = 3 ]; then
  echo "CPU_GOV=3" >> $CONFIGFILE;
elif [ $CPU_GOV = 4 ]; then
  echo "CPU_GOV=4" >> $CONFIGFILE;
elif [ $CPU_GOV = 5 ]; then
  echo "CPU_GOV=5" >> $CONFIGFILE;
elif [ $CPU_GOV = 6 ]; then
  echo "CPU_GOV=6" >> $CONFIGFILE;
elif [ $CPU_GOV = 7 ]; then
  echo "CPU_GOV=7" >> $CONFIGFILE;
elif [ $CPU_GOV = 8 ]; then
  echo "CPU_GOV=8" >> $CONFIGFILE;
elif [ $CPU_GOV = 9 ]; then
  echo "CPU_GOV=9" >> $CONFIGFILE;
elif [ $CPU_GOV = 10 ]; then
  echo "CPU_GOV=10" >> $CONFIGFILE;
elif [ $CPU_GOV = 11 ]; then
  echo "CPU_GOV=11" >> $CONFIGFILE;
elif [ $CPU_GOV = 12 ]; then
  echo "CPU_GOV=12" >> $CONFIGFILE;
elif [ $CPU_GOV = 13 ]; then
  echo "CPU_GOV=13" >> $CONFIGFILE;
elif [ $CPU_GOV = 14 ]; then
  echo "CPU_GOV=14" >> $CONFIGFILE;
elif [ $CPU_GOV = 15 ]; then
  echo "CPU_GOV=15" >> $CONFIGFILE;
elif [ $CPU_GOV = 16 ]; then
  echo "CPU_GOV=16" >> $CONFIGFILE;
else
  echo "CPU_GOV=1" >> $CONFIGFILE;
fi

echo -e "\n\n##############################" >> $CONFIGFILE
#END
