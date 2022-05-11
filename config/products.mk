#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Don't dexpreopt prebuilts. (For GMS).
DONT_DEXPREOPT_PREBUILTS := true

# Include Common Qualcomm Device Tree
$(call inherit-product, device/qcom/common/common.mk)

# Include definitions for Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# Include FortuneOS makefiles
$(call inherit-product, vendor/fortune/config/overlay.mk)
$(call inherit-product, vendor/fortune/config/packages.mk)
$(call inherit-product, vendor/fortune/config/properties.mk)
$(call inherit-product, vendor/fortune/config/version.mk)

# Include GMS, Modules and Pixel features
$(call inherit-product, vendor/google/gms/config.mk)
$(call inherit-product, vendor/google/pixel/config.mk)

ifeq ($(TARGET_FLATTEN_APEX), false)
$(call inherit-product-if-exists, vendor/google/modules/build/mainline_modules_s.mk)
else
$(call inherit-product-if-exists, vendor/google/modules/build/mainline_modules_s_flatten_apex.mk)
endif

ifneq ($(wildcard vendor/google/modules/.),)
# Flatten APEXs for performance
OVERRIDE_TARGET_FLATTEN_APEX := true
# This needs to be specified explicitly to override ro.apex.updatable=true from
# # prebuilt vendors, as init reads /product/build.prop after /vendor/build.prop
PRODUCT_PRODUCT_PROPERTIES += ro.apex.updatable=false
endif

# Include SEPolicy makefile.
$(call inherit-product, vendor/fortune/sepolicy/sepolicy.mk)

# Move Wi-Fi modules to vendor
PRODUCT_VENDOR_MOVE_ENABLED := true

# Optimize everything for preopt
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything

# Permissions
PRODUCT_COPY_FILES += \
    vendor/fortune/config/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    vendor/fortune/config/permissions/privapp_whitelist_com.android.wallpaper.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp_whitelist_com.android.wallpaper.xml

# Skip boot JAR checks
SKIP_BOOT_JARS_CHECK := true

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Compile SystemUI on device with `speed`.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.systemuicompilerfilter=speed

# Pre-optimization
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI

# Sensitive phone numbers and APN configurations
PRODUCT_COPY_FILES += \
    vendor/fortune/prebuilt/etc/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml \
    vendor/fortune/prebuilt/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml
