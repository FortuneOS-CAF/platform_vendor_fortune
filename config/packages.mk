#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# FortuneOS
PRODUCT_PACKAGES += \
    Launcher3QuickStep \
    ThemePicker

# Fonts
include vendor/fortune/config/fonts.mk

# Gestures
PRODUCT_PACKAGES += \
    vendor.aospa.power-service

# GMS
WITH_GMS := true
ifeq ($(TARGET_USES_MINI_GAPPS),true)
$(call inherit-product, vendor/gms/gms_mini.mk)
else ifeq ($(TARGET_USES_PICO_GAPPS),true)
$(call inherit-product, vendor/gms/gms_pico.mk)
else
$(call inherit-product, vendor/gms/gms_full.mk)
endif

# Charger mode images
PRODUCT_PACKAGES += \
    charger_res_images

# Immersive Navigation
PRODUCT_PACKAGES += \
    ImmersiveNavigationOverlay

# OTA
PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/fortune/prebuilt/etc/init/init.fortune-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.fortune-updater.rc

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor

# Include support for additional filesystems
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat

# Telephony - AOSP
PRODUCT_PACKAGES += \
    messaging \
    Stk

# Telephony - CLO
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper.xml \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti-telephony-utils-prd \
    qti_telephony_utils.xml \
    qti_telephony_utils_prd.xml \
    tcmiface \
    telephony-ext

PRODUCT_BOOT_JARS += \
    tcmiface \
    telephony-ext

# TextClassifier
PRODUCT_PACKAGES += \
    libtextclassifier_annotator_en_model \
    libtextclassifier_annotator_universal_model \
    libtextclassifier_actions_suggestions_universal_model \
    libtextclassifier_lang_id_model

# Protobuf - Workaround for prebuilt Qualcomm HAL
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-3.9.1-compat \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

# QTI vendor framework detection
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# Black theme
PRODUCT_PACKAGES += \
    BlackThemeOverlay

# WiFi
PRODUCT_PACKAGES += \
    libwpa_client
