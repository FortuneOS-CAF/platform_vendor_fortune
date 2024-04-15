#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

CLO_REVISION := LA.QSSI.14.0.r1-13500-qssi.0

FORTUNE_REVISION := 1.0
FORTUNE_CODENAME := Urginea
FORTUNE_BUILD_DATE := $(shell date +"%d%m%Y-%H%M")

ifeq ($(FORTUNE_BUILD_TYPE),COMMUNITY)
PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/fortune/prebuilt/etc/init/init.fortune-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.fortune-updater.rc
endif

FORTUNE_VERSION := FRTN.CLO-v$(FORTUNE_REVISION)-$(FORTUNE_BUILD)-$(FORTUNE_BUILD_TYPE)-$(FORTUNE_BUILD_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.clo.revision=$(CLO_REVISION) \
    org.fortune.build.date=$(FORTUNE_BUILD_DATE) \
    org.fortune.build.type=$(FORTUNE_BUILD_TYPE) \
    org.fortune.codename=$(FORTUNE_CODENAME) \
    org.fortune.device=$(FORTUNE_BUILD) \
    org.fortune.fullver=v$(FORTUNE_REVISION)-$(FORTUNE_CODENAME) \
    org.fortune.revision=$(FORTUNE_REVISION) \
    org.fortune.version=$(FORTUNE_VERSION)
