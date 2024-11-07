#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_PACKAGES += \
    FortuneFrameworksOverlay \
    FortuneLauncherOverlay \
    FortuneNetworkStackOverlay \
    FortuneNetworkStackMainlineOverlay \
    FortuneSettingsOverlay \
    FortuneSettingsProviderOverlay \
    FortuneSystemUIOverlay

PRODUCT_COPY_FILES += \
    vendor/fortune/overlay/partition_order.xml:$(TARGET_COPY_OUT_PRODUCT)/overlay/partition_order.xml
