#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# CLO Revision
CLO_REVISION := LA.QSSI.15.0.r1-14100-qssi.0

FORTUNE_BRAND := FortuneOS
FORTUNE_BASE := CLO
FORTUNE_BUILD_VERSION := 15.0
FORTUNE_RELEASETYPE ?= release

FORTUNE_DATE_YEAR := $(shell date -u +%Y)
FORTUNE_DATE_MONTH := $(shell date -u +%m)
FORTUNE_DATE_DAY := $(shell date -u +%d)
FORTUNE_DATE_HOUR := $(shell date -u +%H)
FORTUNE_DATE_MINUTE := $(shell date -u +%M)
FORTUNE_BUILD_DATE_UTC := $(shell date -d '$(FORTUNE_DATE_YEAR)-$(FORTUNE_DATE_MONTH)-$(FORTUNE_DATE_DAY) $(FORTUNE_DATE_HOUR):$(FORTUNE_DATE_MINUTE) UTC' +%s)
FORTUNE_BUILD_DATE := $(FORTUNE_DATE_YEAR)$(FORTUNE_DATE_MONTH)$(FORTUNE_DATE_DAY)-$(FORTUNE_DATE_HOUR)$(FORTUNE_DATE_MINUTE)

FORTUNE_VERSION := $(FORTUNE_BRAND)-$(FORTUNE_BASE)_$(FORTUNE_BUILD)-$(FORTUNE_BUILD_VERSION)-$(FORTUNE_BUILD_DATE)

PRODUCT_SYSTEM_PROPERTIES += \
    org.fortune.brand=$(FORTUNE_BRAND) \
    org.fortune.build.version=$(FORTUNE_BUILD_VERSION) \
    org.fortune.build_date=$(FORTUNE_BUILD_DATE) \
    org.fortune.build_date_utc=$(FORTUNE_BUILD_DATE_UTC) \
    org.fortune.clo.revision=$(CLO_REVISION) \
    org.fortune.device=$(FORTUNE_BUILD) \
    org.fortune.releasetype=$(FORTUNE_RELEASETYPE) \
    org.fortune.version=$(FORTUNE_VERSION)
