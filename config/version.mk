#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

CLO_REVISION := LA.QSSI.14.0.r1-13100-qssi.0

FORTUNE_REVISION := 1.0
FORTUNE_CODENAME := Unicorn
FORTUNE_BUILD_DATE := $(shell date +"%d%m%Y-%H%M")

MAINTAINER_LIST = $(shell cat fortune-keepers/keepers.list)
DEVICE_LIST = $(shell cat fortune-keepers/devices.list)

ifeq ($(filter $(FORTUNE_BUILD), $(DEVICE_LIST)), $(FORTUNE_BUILD))
   ifeq ($(filter $(FORTUNE_KEEPER), $(MAINTAINER_LIST)), $(FORTUNE_KEEPER))
      FORTUNE_BUILD_TYPE := COMMUNITY
  else
     # the builder is overriding official flag on purpose
     ifeq ($(FORTUNE_BUILD_TYPE), COMMUNITY)
       $(error **********************************************************)
       $(error *     A violation has been detected, aborting build      *)
       $(error **********************************************************)
       FORTUNE_BUILD_TYPE := HOMEWADE
     else
       $(warning **********************************************************************)
       $(warning *   There is already an official maintainer for $(FORTUNE_BUILD)    *)
       $(warning *              Setting build type to HOMEWADE                      *)
       $(warning *    Please contact current official maintainer before distributing  *)
       $(warning *              the current build to the community.                   *)
       $(warning **********************************************************************)
       FORTUNE_BUILD_TYPE := HOMEWADE
     endif
  endif
else
   ifeq ($(FORTUNE_BUILD_TYPE), COMMUNITY)
     $(error **********************************************************)
     $(error *     A violation has been detected, aborting build      *)
     $(error **********************************************************)
   endif
  FORTUNE_BUILD_TYPE := HOMEWADE
endif

ifdef FORTUNE_KEEPER
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   org.fortune.keeper=$(FORTUNE_KEEPER)
endif

FORTUNE_VERSION := FRTN.CLO-v$(FORTUNE_REVISION)-$(FORTUNE_BUILD)-$(FORTUNE_BUILD_TYPE)-$(FORTUNE_BUILD_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.clo.revision=$(CLO_REVISION) \
    org.fortune.build.date=$(FORTUNE_BUILD_DATE) \
    org.fortune.build.type=$(FORTUNE_BUILD_TYPE) \
    org.fortune.codename=$(FORTUNE_CODENAME) \
    org.fortune.device=$(FORTUNE_BUILD) \
    org.fortune.revision=$(FORTUNE_REVISION) \
    org.fortune.version=$(FORTUNE_VERSION)
