#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Include Common Qualcomm Device Tree
$(call inherit-product, device/qcom/common/common.mk)

# Include definitions for Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# Include FortuneOS makefiles
$(call inherit-product, vendor/fortune/config/overlay.mk)
$(call inherit-product, vendor/fortune/config/packages.mk)
$(call inherit-product, vendor/fortune/config/properties.mk)
$(call inherit-product, vendor/fortune/config/version.mk)

# Move Wi-Fi modules to vendor
PRODUCT_VENDOR_MOVE_ENABLED := true

# Permissions
PRODUCT_COPY_FILES += \
    vendor/fortune/config/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    vendor/fortune/config/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    vendor/fortune/config/permissions/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml
