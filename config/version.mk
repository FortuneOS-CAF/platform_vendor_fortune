#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# CLO Revision
CLO_REVISION := LA.QSSI.15.0.r1-14100-qssi.0

FORTUNE_BUILD_VERSION := 1.0
FORTUNE_BUILD_DATE := $(shell date +"%d%m%Y-%H%M")
FORTUNE_CODENAME := Viola
FORTUNE_RELEASETYPE ?= release

FORTUNE_VERSION := \
    FortuneOS-v$(FORTUNE_BUILD_VERSION)-$(FORTUNE_BUILD)-$(FORTUNE_BUILD_DATE)-$(FORTUNE_RELEASETYPE)

PRODUCT_SYSTEM_PROPERTIES += \
    org.fortune.build.version=$(FORTUNE_BUILD_VERSION) \
    org.fortune.build_date=$(FORTUNE_BUILD_DATE) \
    org.fortune.codename=$(FORTUNE_CODENAME) \
    org.fortune.clo.revision=$(CLO_REVISION) \
    org.fortune.device=$(FORTUNE_BUILD) \
    org.fortune.releasetype=$(FORTUNE_RELEASETYPE) \
    org.fortune.version=$(FORTUNE_VERSION)

# Signing
ifneq (,$(wildcard vendor/fortune/build/security/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/fortune/build/security/releasekey
endif
ifneq (,$(wildcard vendor/fortune/build/security/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/fortune/build/security/otakey.x509.pem
endif
