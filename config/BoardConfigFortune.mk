# Kernel
include vendor/fortune/config/BoardConfigKernel.mk

# SEPolicy
ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    vendor/fortune/sepolicy/dynamic
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/fortune/sepolicy/dynamic
endif

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    vendor/fortune/sepolicy/private

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    vendor/fortune/sepolicy/public

BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/fortune/sepolicy/vendor

