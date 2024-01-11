#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

FORTUNE_ZIP_NAME := $(FORTUNE_VERSION).zip
FORTUNE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(FORTUNE_ZIP_NAME)

.PHONY: fortune
fortune: $(INTERNAL_OTA_PACKAGE_TARGET)
	@echo "FortuneOS OTA package"
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(FORTUNE_TARGET_PACKAGE)
	@echo ""
	@echo "Package Completed:"
	@echo ""
	@echo "█▀▀ █▀█ █▀█ ▀█▀ █░█ █▄░█ █▀▀"
	@echo "█▀░ █▄█ █▀▄ ░█░ █▄█ █░▀█ ██▄"
	@echo "═══════════════════════════════════════════════════════════════════"
	@echo "Zip: $(FORTUNE_TARGET_PACKAGE)"
	@echo "Size: `du -h "$(FORTUNE_TARGET_PACKAGE)" | cut -f1`"
	@echo "SHA256: `sha256sum $(FORTUNE_TARGET_PACKAGE) | cut -f 1 -d " "`"
	@echo "MD5: `md5sum $(FORTUNE_TARGET_PACKAGE) | cut -f 1 -d " "`"
	@echo "═══════════════════════════════════════════════════════════════════"
	@echo "" >&2

.PHONY: bacon
bacon: fortune
