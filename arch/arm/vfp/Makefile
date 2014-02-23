#
# linux/arch/arm/vfp/Makefile
#
# Copyright (C) 2001 ARM Limited
#

# ccflags-y := -DDEBUG
# asflags-y := -DDEBUG

KBUILD_AFLAGS  :=$(KBUILD_AFLAGS:-msoft-float=-Wa, -O3 -mcpu=cortex-a15 -mfpu=neon-vfpv4 -ftree-vectorize -mfloat-abi=hard -ffast-math -fsingle-precision-constant)

LDFLAGS		+=--no-warn-mismatch

obj-y			+= vfp.o

vfp-$(CONFIG_VFP)	+= vfpmodule.o entry.o vfphw.o vfpsingle.o vfpdouble.o
