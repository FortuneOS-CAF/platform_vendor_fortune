#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

FORTUNE_TARGET_UPDATEPACKAGE := $(PRODUCT_OUT)/$(FORTUNE_VERSION)-img.zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

CL_CYN="\033[36m"
CL_PRP="\033[35m"

.PHONY: updatepackage bacon-fastboot
updatepackage: $(INTERNAL_UPDATE_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_UPDATE_PACKAGE_TARGET) $(FORTUNE_TARGET_UPDATEPACKAGE)
	$(hide) $(SHA256) $(FORTUNE_TARGET_UPDATEPACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(FORTUNE_TARGET_UPDATEPACKAGE).sha256sum
	echo -e ${CL_BLD}${CL_CYN}"===============================-Package complete-==============================="${CL_CYN}
	echo -e ${CL_BLD}${CL_CYN}"Datetime :"${CL_PRP}" `cat $(PRODUCT_OUT)/system/build.prop | grep ro.build.date.utc | cut -d'=' -f2 | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_CYN}"Size:"${CL_PRP}" `du -sh $(FORTUNE_TARGET_UPDATEPACKAGE) | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_CYN}"Filehash: "${CL_PRP}" `md5sum $(FORTUNE_TARGET_UPDATEPACKAGE) | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_CYN}"Filename: "${CL_PRP} $(FORTUNE_TARGET_UPDATEPACKAGE)${CL_RST}
	echo -e ${CL_BLD}${CL_CYN}"ID: "${CL_PRP}" `cat $(FORTUNE_TARGET_UPDATEPACKAGE).sha256sum | awk '{print $$1}' `"${CL_RST}
	echo -e ${CL_BLD}${CL_CYN}"================================================================================"${CL_CYN}

bacon-fastboot: updatepackage
