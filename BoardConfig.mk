DEVICE_PATH := device/samsung/gta3xllte

# Inherit common board flags FIRST, then override
include device/samsung/universal7904-common/BoardConfigCommon.mk

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Display — override common tree's 420 for 10.1" tablet
TARGET_SCREEN_DENSITY := 240

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.force_normal_boot=1
TARGET_KERNEL_CONFIG := gta3xllte_defconfig
BOARD_USES_RECOVERY_AS_BOOT := false
# from wisdom device tree, works good af
BOARD_MKBOOTIMG_ARGS += --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --second_offset 0x00f00000 --tags_offset 0x00000100 --header_version 1 --board SRPSA16A009RU --os_version 12.0.0 --os_patch_level 2099-12
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/t510_bootimg.mk
BOARD_RECOVERY_IMAGE_PREPARE += \
    grep -q '^ro.adb.secure.recovery=' $(TARGET_RECOVERY_ROOT_OUT)/prop.default || echo 'ro.adb.secure.recovery=0' >> $(TARGET_RECOVERY_ROOT_OUT)/prop.default; \
    grep -q '^service.adb.root=' $(TARGET_RECOVERY_ROOT_OUT)/prop.default || echo 'service.adb.root=1' >> $(TARGET_RECOVERY_ROOT_OUT)/prop.default;

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3196059648
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 46137344
BOARD_VENDORIMAGE_PARTITION_SIZE := 343932928
BOARD_CACHEIMAGE_PARTITION_SIZE := 159383552
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/efs:/efs \
    /mnt/vendor/efs:/factory
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.exynos7904
BOARD_INCLUDE_RECOVERY_DTBO := true

# Samsung bootloader loads ramdisk from recovery partition.
# Flash boot.img to recovery during OTA install. bullshit but ok, avg vibecoding
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Fingerprint — SM-T515 has no fingerprint sensor
TARGET_HAS_NO_FINGERPRINT := true

# Sepolicy
BOARD_SEPOLICY_TEE_FLAVOR := mobicore
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# SPL
VENDOR_SECURITY_PATCH := 2023-02-01

# we're gonna use prebuilt dtbo
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/dtbo_prebuilt.img
BOARD_PREBUILT_RECOVERY_DTBOIMAGE := $(DEVICE_PATH)/dtbo_prebuilt.img
