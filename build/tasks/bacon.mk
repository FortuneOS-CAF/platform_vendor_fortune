#
# Copyright (C) 2025 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# -----------------------------------------------------------------
# FortuneOS OTA update package

FORTUNE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(FORTUNE_VERSION).zip

.PHONY: fortune
fortune: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(FORTUNE_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(FORTUNE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(FORTUNE_TARGET_PACKAGE).md5sum
	@echo "Package Complete: $(FORTUNE_TARGET_PACKAGE)" >&2
