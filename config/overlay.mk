#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_PACKAGES += \
    FortuneFrameworksOverlay \
    FortuneLauncherOverlay \
    FortuneSettingsOverlay \
    FortuneSettingsProviderOverlay \
    FortuneSystemUIOverlay \
    FortuneWifiOverlay

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/fortune/overlay/static
PRODUCT_PACKAGE_OVERLAYS += vendor/fortune/overlay/static
