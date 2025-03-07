#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# -----------------------------------------------------------------
# FortuneOS OTA update package

FORTUNE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(FORTUNE_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

CL_PNK := "\033[38;5;206m"
CL_BLD := "\033[1m"
CL_RST := "\033[0m"

.PHONY: fortune
fortune: $(DEFAULT_GOAL) $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(FORTUNE_TARGET_PACKAGE)
	$(hide) $(SHA256) $(FORTUNE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(FORTUNE_TARGET_PACKAGE).sha256sum
	echo -e ${CL_BLD}${CL_PNK}"===============================-Package complete-==============================="${CL_PNK}
	echo -e ${CL_BLD}${CL_PNK}"Zip: "${CL_PNK} $(FORTUNE_TARGET_PACKAGE)${CL_RST}
	echo -e ${CL_BLD}${CL_PNK}"SHA256: "${CL_PNK}" `cat $(FORTUNE_TARGET_PACKAGE).sha256sum | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_PNK}"Size:"${CL_PNK}" `du -sh $(FORTUNE_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_PNK}"TimeStamp:"${CL_PNK}" `cat $(PRODUCT_OUT)/system/build.prop | grep ro.build.date.utc | cut -d'=' -f2 | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_PNK}"Integer Value:"${CL_PNK}" `wc -c $(FORTUNE_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_PNK}"================================================================================"${CL_PNK}
