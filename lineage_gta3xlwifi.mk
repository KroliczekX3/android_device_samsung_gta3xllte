#
# Copyright (C) 2024-25 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_arm.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit from gta3xlwifi device
$(call inherit-product, device/samsung/gta3xlwifi/full_gta3xlwifi.mk)

# Inherit some common Lineage stuff
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := gta3xlwifi
PRODUCT_MANUFACTURER := samsung
PRODUCT_NAME := lineage_gta3xlwifi
PRODUCT_MODEL := SM-T510

PRODUCT_PACKAGES += apns-conf.xml

# we are gonna use selinux permissive for now
SELINUX_IGNORE_NEVERALLOWS := true
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true

WITH_GMS := true
TARGET_SUPPORTS_64_BIT_APPS := true

# Use the latest approved GMS identifiers
PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss
BUILD_FINGERPRINT := "samsung/gta3xlwifixx/gta3xlwifi:11/RP1A.200720.012/T510XXU5CWA1:user/release-keys"

# will never update
TARGET_DISABLE_LINEAGE_UPDATER := true

