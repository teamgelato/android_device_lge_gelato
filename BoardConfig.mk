-include vendor/lge/gelato/BoardConfigVendor.mk
-include device/lge/msm7x27-common/BoardConfigCommon.mk

TARGET_KERNEL_CONFIG := gelato-perf_defconfig

TARGET_BOOTLOADER_BOARD_NAME := gelato
TARGET_OTA_ASSERT_DEVICE := gelato,vm701

SMALLER_FONT_FOOTPRINT := true

BOARD_KERNEL_CMDLINE := mem=477M console=ttyMSM2,115200n8 androidboot.hardware=gelato

# Fix this up by examining /proc/mtd on a running device
BOARD_KERNEL_BASE := 0x12800000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00700000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x09e00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0b500000
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/gelato/bluetooth

USE_CAMERA_STUB := false
