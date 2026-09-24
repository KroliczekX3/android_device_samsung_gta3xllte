#
# Copyright (C) 2024-25 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit common crDroid stuff
$(call inherit-product, vendor/crdroid/config/common.mk)

# Inherit from gta3xllte device
$(call inherit-product, device/samsung/gta3xllte/full_gta3xllte.mk)

# Product specs
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := gta3xllte
PRODUCT_MANUFACTURER := samsung
PRODUCT_NAME := crdroid_gta3xllte
PRODUCT_MODEL := SM-T515

PRODUCT_PACKAGES += apns-conf.xml

# Force permissive SELinux for now
SELINUX_IGNORE_NEVERALLOWS := true
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true

WITH_GMS := true
TARGET_SUPPORTS_64_BIT_APPS := true

# Use the latest approved GMS identifiers
PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss
BUILD_FINGERPRINT := "samsung/gta3xlxxe/gta3xllte:11/RP1A.200720.012/T515XXU8CVK1:user/release-keys"

# Disable lineage updater
TARGET_DISABLE_LINEAGE_UPDATER := true
