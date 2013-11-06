#
# Makefile for sensor chip drivers.
#

obj-$(CONFIG_THERMAL)		+= thermal_sys.o
obj-$(CONFIG_THERMAL_MSM_POPMEM)	+= msm_popmem-tm.o
obj-$(CONFIG_THERMAL_TSENS)	+= msm_tsens.o
obj-$(CONFIG_THERMAL_TSENS8960) += msm8960_tsens.o
obj-$(CONFIG_THERMAL_PM8XXX)	+= pm8xxx-tm.o
ifdef CONFIG_BRICKED_THERMAL
	obj-y	+= msm_thermal.o
else
	obj-$(CONFIG_THERMAL_MONITOR)	+= msm_thermal_qcom.o
endif
obj-$(CONFIG_SPEAR_THERMAL)		+= spear_thermal.o