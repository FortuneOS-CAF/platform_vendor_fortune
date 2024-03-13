#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# FortuneOS
$(call inherit-product, vendor/fortune/config/keepers.mk)
$(call inherit-product, vendor/fortune/config/packages.mk)
$(call inherit-product, vendor/fortune/config/properties.mk)
$(call inherit-product, vendor/fortune/config/version.mk)

# Addons
$(call inherit-product, vendor/addons/config.mk)

# Qualcomm Common configuration
$(call inherit-product, device/qcom/common/common.mk)

# SDClang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# Certification
$(call inherit-product-if-exists, vendor/certification/config.mk)

# Overlays
# TODO: Convert to RRO
PRODUCT_PACKAGE_OVERLAYS += vendor/fortune/overlay

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
     vendor/fortune/config/fortune_vendor_framework_compatibility_matrix.xml

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

# Enable allowlist for some aosp packages that should not be scanned in a "stopped" state
# Some CTS test case failed after enabling feature config_stopSystemPackagesByDefault
PRODUCT_PACKAGES += initial-package-stopped-states-aosp.xml

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= false

ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Inherit from GMS product config
$(call inherit-product-if-exists, vendor/google/gms/config.mk)
$(call inherit-product-if-exists, vendor/google/pixel/config.mk)

# Permissions
PRODUCT_COPY_FILES += \
    vendor/fortune/prebuilt/etc/permissions/default_permissions_com.google.android.deskclock.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default_permissions_com.google.android.deskclock.xml
