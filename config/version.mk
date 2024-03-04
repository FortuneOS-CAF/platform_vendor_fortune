#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

CLO_REVISION := LA.QSSI.14.0.r1-14600-qssi.0

FORTUNE_REVISION := 14.0
FORTUNE_CODENAME := Usagi
FORTUNE_BUILD_TYPE := INSIDEHOUSE
FORTUNE_BUILD_DATE := $(shell date +"%d%m%Y-%H%M")

FORTUNE_VERSION := \
    IDN.FRTN.CLO.$(FORTUNE_REVISION)-$(FORTUNE_CODENAME)-$(FORTUNE_BUILD)-$(FORTUNE_BUILD_TYPE)-$(FORTUNE_BUILD_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.clo.revision=$(CLO_REVISION) \
    org.fortune.build.date=$(FORTUNE_BUILD_DATE) \
    org.fortune.build.type=$(FORTUNE_BUILD_TYPE) \
    org.fortune.codename=$(FORTUNE_CODENAME) \
    org.fortune.revision=$(FORTUNE_REVISION) \
    org.fortune.version=$(FORTUNE_VERSION)
