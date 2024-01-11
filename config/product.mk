#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# SDClang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# Inherit FortuneOS Makefiles
$(call inherit-product, vendor/fortune/config/packages.mk)
$(call inherit-product, vendor/fortune/config/properties.mk)
$(call inherit-product, vendor/fortune/config/version.mk)

# Overlays
# TODO: Convert to RRO
PRODUCT_PACKAGE_OVERLAYS += vendor/fortune/overlay

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/fortune/prebuilt/media/bootanimation.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip

# APN list
PRODUCT_COPY_FILES += \
    vendor/fortune/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Dex optimization
USE_DEX2OAT_DEBUG := false
WITH_DEXPREOPT_DEBUG_INFO := false
DONT_DEXPREOPT_PREBUILTS := true
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything

# Enable whole-program R8 Java optimizations for SystemUI and system_server,
# but also allow explicit overriding for testing and development.
SYSTEM_OPTIMIZE_JAVA ?= true
SYSTEMUI_OPTIMIZE_JAVA ?= true

# Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/fortune/prebuilt/fonts/,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    vendor/fortune/prebuilt/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

PRODUCT_PACKAGES += \
    FontGoogleSansLatoOverlay \
    FontHarmonySansOverlay \
    FontInterOverlay \
    FontManropeOverlay \
    FontOnePlusOverlay \
    FontOppoSansOverlay \
    FontRobotoOverlay \
    FontUrbanistOverlay

$(call inherit-product-if-exists, external/google-fonts/lato/fonts.mk)

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true

ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Permissions
PRODUCT_COPY_FILES += \
    vendor/fortune/prebuilt/etc/permissions/default_permissions_com.google.android.deskclock.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default_permissions_com.google.android.deskclock.xml
