#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B OTA Optimization
ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script
endif

# Curl
PRODUCT_PACKAGES += \
    curl

# Exfat FS
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# Camera
PRODUCT_PACKAGES += \
    GoogleCameraGo

# Set compiler filter "verify" and disable AOT-compilation in dexpreopt
RELAX_USES_LIBRARY_CHECK := true

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor

# Neural Network
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-rtti

# QTI VNDK Framework Detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect_system \
    libqti_vndfwk_detect_vendor \
    libvndfwk_detect_jni.qti_system \
    libvndfwk_detect_jni.qti_vendor \
    libvndfwk_detect_jni.qti.vendor \
    libqti_vndfwk_detect.vendor

# Theme Picker
PRODUCT_PACKAGES += \
    FortuneThemePicker

# Telephony - AOSP
PRODUCT_PACKAGES += \
    Stk

# Telephony - CLO
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml \
    tcmiface \
    telephony-ext \
    qti-telephony-hidl-wrapper \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper.xml \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti-telephony-utils-prd \
    qti_telephony_utils.xml \
    qti_telephony_utils_prd.xml

PRODUCT_BOOT_JARS += \
    tcmiface \
    telephony-ext

# WiFi
PRODUCT_PACKAGES += \
    libwpa_client
