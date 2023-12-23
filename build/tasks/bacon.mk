#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# -----------------------------------------------------------------
# FortuneOS OTA update package

FORTUNE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(FORTUNE_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: fortune
fortune: $(DEFAULT_GOAL) $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(FORTUNE_TARGET_PACKAGE)
	$(hide) $(SHA256) $(FORTUNE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(FORTUNE_TARGET_PACKAGE).sha256sum
	@echo "Package Complete: $(FORTUNE_TARGET_PACKAGE)" >&2
