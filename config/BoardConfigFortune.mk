#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Disable EAP Proxy because it depends on proprietary headers
# and breaks WPA Supplicant compilation.
DISABLE_EAP_PROXY := true

# Include our Qualcomm Board configuration.
include device/qcom/common/BoardConfigQcom.mk

# Kernel configuration.
include vendor/fortune/config/BoardConfigKernel.mk

# Soong
include vendor/fortune/config/BoardConfigSoong.mk
