#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Include Common Qualcomm Device Tree
$(call inherit-product, device/qcom/common/common.mk)

# Include definitions for Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# Move Wi-Fi modules to vendor
PRODUCT_VENDOR_MOVE_ENABLED := true
