#!/sbin/sh

#set max_oc
val0=$(cat /tmp/aroma-data/freq0.prop | cut -d '=' -f2)

case $val0 in

	1)
	  oc0="oc0=1134000"
	  ;;
	2)
	  oc0="oc0=1350000"
	  ;;
	3)
	  oc0="oc0=1566000"
	  ;;
	4)
	  oc0="oc0=1728000"
	  ;;
  	5)
	  oc0="oc0=1836000"
	  ;;
  	6)
	  oc0="oc0=1890000"
	  ;;
	7)
	  oc0="oc0=1944000"
	  ;;
	8)
	  oc0="oc0=1998000"
	  ;;
	9)
	  oc0="oc0=2052000"
	  ;;
	10)
	  oc0="oc0=2106000"
	  ;;
	11)
	  oc0="oc0=2133000"
	  ;;
	12)
	  oc0="oc0=2160000"
	  ;;
	13)
	  oc0="oc0=2214000"
	  ;;
	14)
	  oc0="oc0=2295000"
	  ;;
esac

if [ ! -e /tmp/aroma-data/freq1.prop ]; then
	cp /tmp/aroma-data/freq0.prop /tmp/aroma-data/freq1.prop;
	cp /tmp/aroma-data/freq0.prop /tmp/aroma-data/freq2.prop;
	cp /tmp/aroma-data/freq0.prop /tmp/aroma-data/freq3.prop;
fi

val1=$(cat /tmp/aroma-data/freq1.prop | cut -d '=' -f2)
case $val1 in

	1)
	  oc1="oc1=1134000"
	  ;;
	2)
	  oc1="oc1=1350000"
	  ;;
	3)
	  oc1="oc1=1566000"
	  ;;
	4)
	  oc1="oc1=1728000"
	  ;;
  	5)
	  oc1="oc1=1836000"
	  ;;
  	6)
	  oc1="oc1=1890000"
	  ;;
	7)
	  oc1="oc1=1944000"
	  ;;
	8)
	  oc1="oc1=1998000"
	  ;;
	9)
	  oc1="oc1=2052000"
	  ;;
	10)
	  oc1="oc1=2106000"
	  ;;
	11)
	  oc1="oc1=2133000"
	  ;;
	12)
	  oc1="oc1=2160000"
	  ;;
	13)
	  oc1="oc1=2214000"
	  ;;
	14)
	  oc1="oc1=2295000"
	  ;;
esac

val2=$(cat /tmp/aroma-data/freq2.prop | cut -d '=' -f2)
case $val2 in

	1)
	  oc2="oc2=1134000"
	  ;;
	2)
	  oc2="oc2=1350000"
	  ;;
	3)
	  oc2="oc2=1566000"
	  ;;
	4)
	  oc2="oc2=1728000"
	  ;;
  	5)
	  oc2="oc2=1836000"
	  ;;
  	6)
	  oc2="oc2=1890000"
	  ;;
	7)
	  oc2="oc2=1944000"
	  ;;
	8)
	  oc2="oc2=1998000"
	  ;;
	9)
	  oc2="oc2=2052000"
	  ;;
	10)
	  oc2="oc2=2106000"
	  ;;
	11)
	  oc2="oc2=2133000"
	  ;;
	12)
	  oc2="oc2=2160000"
	  ;;
	13)
	  oc2="oc2=2214000"
	  ;;
	14)
	  oc2="oc2=2295000"
	  ;;
esac

val3=$(cat /tmp/aroma-data/freq3.prop | cut -d '=' -f2)
case $val3 in

	1)
	  oc3="oc3=1134000"
	  ;;
	2)
	  oc3="oc3=1350000"
	  ;;
	3)
	  oc3="oc3=1566000"
	  ;;
	4)
	  oc3="oc3=1728000"
	  ;;
  	5)
	  oc3="oc3=1836000"
	  ;;
  	6)
	  oc3="oc3=1890000"
	  ;;
	7)
	  oc3="oc3=1944000"
	  ;;
	8)
	  oc3="oc3=1998000"
	  ;;
	9)
	  oc3="oc3=2052000"
	  ;;
	10)
	  oc3="oc3=2106000"
	  ;;
	11)
	  oc3="oc3=2133000"
	  ;;
	12)
	  oc3="oc3=2160000"
	  ;;
	13)
	  oc3="oc3=2214000"
	  ;;
	14)
	  oc3="oc3=2295000"
	  ;;
esac


#set GPU oc
val5=$(cat /tmp/aroma-data/gpu.prop | cut -d '=' -f2)

case $val5 in
	1)
	  ocG="ocG=0"
	  ;;
	*)
	  ocG="ocG=1"
	  ;;
esac


#set undervolting
val7=$(cat /tmp/aroma-data/uv.prop | cut -d '=' -f2)

case $val7 in
	1)
	  uv="uv=0"
	  ;;
	2)
	  uv="uv=1"
	  ;;
	3)
	  uv="uv=2"
	  ;;
	4)
	  uv="uv=3"
	  ;;
	5)
	  uv="uv=4"
	  ;;
	6)
	  uv="uv=5"
	  ;;
	7)
	  uv="uv=6"
	  ;;
esac

echo "cmdline = console=ttyHSL0,115200,n8 androidboot.hardware=m7 user_debug=31" $oc0 $oc1 $oc2 $oc3 $ocG $uv >> /tmp/cmdline.cfg
