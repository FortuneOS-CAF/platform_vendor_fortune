# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += fortuneVarsPlugin

SOONG_CONFIG_fortuneVarsPlugin :=

define addVar
  SOONG_CONFIG_fortuneVarsPlugin += $(1)
  SOONG_CONFIG_fortuneVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += fortuneGlobalVars
SOONG_CONFIG_fortuneGlobalVars += \
    needs_camera_boottime \
    target_init_vendor_lib \
    target_ld_shim_libs \
    target_process_sdk_version_override \
    target_surfaceflinger_udfps_lib

# Set default values
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_SURFACEFLINGER_UDFPS_LIB ?= surfaceflinger_udfps_lib

# Soong value variables
SOONG_CONFIG_fortuneGlobalVars_needs_camera_boottime := $(TARGET_CAMERA_BOOTTIME_TIMESTAMP)
SOONG_CONFIG_fortuneGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_fortuneGlobalVars_target_ld_shim_libs := $(subst $(space),:,$(TARGET_LD_SHIM_LIBS))
SOONG_CONFIG_fortuneGlobalVars_target_process_sdk_version_override := $(TARGET_PROCESS_SDK_VERSION_OVERRIDE)
SOONG_CONFIG_fortuneGlobalVars_target_surfaceflinger_udfps_lib := $(TARGET_SURFACEFLINGER_UDFPS_LIB)

# Qualcomm variables
SOONG_CONFIG_NAMESPACES += aosp_vs_qva
SOONG_CONFIG_aosp_vs_qva += aosp_or_qva
SOONG_CONFIG_aosp_vs_qva_aosp_or_qva := qva

SOONG_CONFIG_NAMESPACES += bredr_vs_btadva
SOONG_CONFIG_bredr_vs_btadva += bredr_or_btadva
ifneq "$(wildcard vendor/qcom/proprietary/commonsys/bt/bt_adv_audio)" ""
    $(warning bt_adv_audio dir is present)
    SOONG_CONFIG_bredr_vs_btadva_bredr_or_btadva := btadva
else
    $(warning bt_adv_audio dir is not present)
    SOONG_CONFIG_bredr_vs_btadva_bredr_or_btadva := bredr
endif #ifneq "$(wildcard vendor/qcom/proprietary/commonsys/bt/bt_adv_audio)" ""
