#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Dex2oat
ifeq ($(TARGET_CPU_VARIANT),cortex-a510)
    DEX2OAT_TARGET_CPU_VARIANT := cortex-a76
    DEX2OAT_TARGET_CPU_VARIANT_RUNTIME := cortex-a76
endif

ifeq ($(call is-board-platform-in-list,$(QCOM_BOARD_PLATFORMS)),true)
# Include our Qualcomm Board configuration.
include device/qcom/common/BoardConfigQcom.mk
endif

# Kernel configuration.
include vendor/fortune/config/BoardConfigKernel.mk

# Soong
include vendor/fortune/config/BoardConfigSoong.mk
