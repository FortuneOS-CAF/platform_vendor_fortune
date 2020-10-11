#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Bootanimation
TARGET_BOOT_ANIMATION_RES ?= 1080

ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/fortune/prebuilt/media/bootanimation-dark_720.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/fortune/prebuilt/media/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/fortune/prebuilt/media/bootanimation-dark_1440.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),undefined)
     $(warning Target bootanimation res is undefined, using 1080p bootanimation )
     PRODUCT_COPY_FILES += vendor/fortune/prebuilt/media/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else
     $(warning Defined bootanimation res is wrong, using 1080p bootanimation )
     PRODUCT_COPY_FILES += vendor/fortune/prebuilt/media/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif
