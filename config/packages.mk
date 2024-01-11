#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Charger mode images
PRODUCT_PACKAGES += \
    charger_res_images

# Camera
PRODUCT_PACKAGES += \
    Camera

# Immersive Navigation
PRODUCT_PACKAGES += \
    ImmersiveNavigationOverlay

# Themes
PRODUCT_PACKAGES += \
    ThemePicker

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

# QTI vendor framework detection
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# Wallique
PRODUCT_PACKAGES += \
   Wallique

# Repainter (kdrag0n)
PRODUCT_PACKAGES += \
    RepainterServicePriv

