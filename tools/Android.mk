LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := Changelog.txt
LOCAL_MODULE_CLASS := ETC
CHANGELOG_FILE := $(local-generated-sources-dir)/Changelog.txt
CHANGELOG_SCRIPT := vendor/fortune/tools/changelog
$(CHANGELOG_FILE): PRIVATE_CHANGELOG_SCRIPT := $(CHANGELOG_SCRIPT)
$(CHANGELOG_FILE): PRIVATE_CHANGELOG_FILE := $(CHANGELOG_FILE)
$(CHANGELOG_FILE): $(PRIVATE_CHANGELOG_SCRIPT) $(PRIVATE_CHANGELOG_FILE)
	@echo "Generating Changelog"
	$(shell $(PRIVATE_CHANGELOG_SCRIPT) $(PRIVATE_CHANGELOG_FILE))

LOCAL_PREBUILT_MODULE_FILE := $(CHANGELOG_FILE)
include $(BUILD_PREBUILT)
