#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# CLO Revision
CLO_REVISION := LA.QSSI.14.0.r1-11200-qssi.0

FORTUNE_ANDROID := 14.0
FORTUNE_CODENAME := Unity
FORTUNE_BUILD_DATE := $(shell date +"%d%m%Y-%H%M")

ifndef FORTUNE_BUILD_TYPE
	FORTUNE_BUILD_TYPE := UNOFFICIAL
endif

FORTUNE_VERSION := FortuneOS-$(FORTUNE_ANDROID)-$(FORTUNE_BUILD)-$(FORTUNE_BUILD_TYPE)-$(FORTUNE_BUILD_DATE)
FORTUNE_BUILD_VERSION := FortuneOS.$(FORTUNE_ANDROID)-$(FORTUNE_CODENAME).$(FORTUNE_BUILD_TYPE)

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    org.fortune.build.date=$(FORTUNE_BUILD_DATE) \
    org.fortune.build.version=$(FORTUNE_BUILD_VERSION) \
    org.fortune.clo.revision=$(CLO_REVISION) \
    org.fortune.codename=$(FORTUNE_CODENAME) \
    org.fortune.device=$(FORTUNE_BUILD) \
    org.fortune.version=$(FORTUNE_ANDROID)
