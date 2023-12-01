#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
# Copyright (C) 2019-Present A-Team Digital Solutions
#

DEVICE_PATH := device/motorola/rhodep

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true
BUILD_BROKEN_DUP_RULES := true

# Assert
TARGET_OTA_ASSERT_DEVICE := rhodep

# Build Error Bypass Fix
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Build Flags
ALLOW_MISSING_DEPENDENCIES := true
LC_ALL := "C"

# Build Flags - Twrp Specific
OF_MAINTAINER := plagio3000
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := 1
#OF_VIRTUAL_AB_DEVICE := 1
#OF_AB_DEVICE := 1
OF_USE_MAGISKBOOT_FOR_ALL_PATCHES := 1
#OF_VIRTUAL_AB_DEVICE := 1
OF_SKIP_FBE_DECRYPTION := 1
#FOX_ADVANCED_SECURITY := 1
FOX_ENABLE_APP_MANAGER := 1
FOX_USE_SPECIFIC_MAGISK_ZIP=~/Desktop/Magisk-v26.1.zip
OF_NO_ADDITIONAL_MIUI_PROPS_CHECK := 1
#OF_FORCE_PREBUILT_KERNEL := 1
#OF_FLASHLIGHT_ENABLE := 1
#OF_FL_PATH1="/sys/class/leds/led_torch_2"

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_VENDOR := vendor
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
#BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_CMDLINE += twrpfastboot=1
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.hab.cid=50
BOARD_KERNEL_CMDLINE += androidboot.hab.csv=5
BOARD_KERNEL_CMDLINE += androidboot.hab.product=rhodep
BOARD_KERNEL_CMDLINE += androidboot.memcg=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=4e00000.dwc3
BOARD_KERNEL_CMDLINE += buildvariant=eng
BOARD_KERNEL_CMDLINE += cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0x04C8C000
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image 
BOARD_KERNEL_CMDLINE += ip6table_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += pcie_ports=compat
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=0
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000

KERNEL_LD := LLVM=1
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := rhodep_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/rhodep

# kernel Prebuilt
#TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb

BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Disable For Prebuilt Kernel
#BOARD_INCLUDE_DTB_IN_BOOTIMG := true
#BOARD_KERNEL_SEPARATED_DTBO := true

# Encryption
#BOARD_USES_METADATA_PARTITION := true
#BOARD_USES_QCOM_FBE_DECRYPTION := true
PLATFORM_SECURITY_PATCH := 2127-12-31
#PLATFORM_VERSION := 16.1.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
#TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#TW_USE_FSCRYPT_POLICY := 1
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/system/lib64/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.base@1.0 \
    ashmemd \
    ashmemd_aidl_interface-cpp \
    android.hardware.boot@1.0-impl-1.1-qti \
    bootctrl.holi \
    bootctrl.holi.recovery \
    libashmemd_client \
    libcap \
    libion \
    libpcrecpp \
    libxml2

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_VENDORIMAGE_PARTITION_SIZE := 975491072
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4640314624

# Super Partition
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 9831448576
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := product system system_ext vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9827254272 # (BOARD_SUPER_PARTITION_SIZE - 4MB)

# Platform
TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := holi
TARGET_USES_UEFI := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_FSTAB_FILE += $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXCLUDE_TWRPAPP := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone79/temp"
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_Y_OFFSET := 120
TW_H_OFFSET := -120
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_APEX := true
TW_NEW_ION_HEAP := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_TIMEOUT := true

TW_RECOVERY_ADDITIONAL_RELINK_BINARY_FILES += \
    $(TARGET_OUT_EXECUTABLES)/ashmemd \
    $(TARGET_OUT_EXECUTABLES)/strace
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.base@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpcrecpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so

# TWRP Debug Flags
TARGET_USES_LOGD := true
TWRP_EVENT_LOGGING := false
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd

# TWRP Installer
RECOVERY_INSTALLER_PATH := bootable/recovery/installer
USE_RECOVERY_INSTALLER := true

# Kernel module loading
TW_LOAD_VENDOR_MODULES := "adapter_class.ko \
            bq2589x_charger.ko \
            bq2597x_mmi_iio.ko \
            cw2217b_fg_mmi.ko \
            exfat.ko \
            goodix_brl_mmi.ko \
            ldo_vibrator_mmi.ko \
            mmi_annotate.ko \
            mmi_charger.ko \
            mmi_discrete_charger_class.ko \
            mmi_discrete_charger.ko \
            mmi_info.ko \
            mmi_sys_temp.ko \
            moto_f_usbnet.ko \
            qpnp_adaptive_charge.ko \
            rt_pd_manager.ko \
            sensors_class.ko \
            sgm4154x_charger.ko \
            sm5602_fg_mmi.ko \
            synaptics_tcm_core.ko \
            synaptics_tcm_device.ko \
            synaptics_tcm_diagnostics.ko \
            synaptics_tcm_i2c.ko \
            synaptics_tcm_recovery.ko \
            synaptics_tcm_reflash.ko \
            synaptics_tcm_spi.ko \
            synaptics_tcm_testing.ko \
            synaptics_tcm_touch.ko \
            synaptics_tcm_zeroflash.ko \
            tcpc_class.ko \
            tcpc_sgm7220.ko \
            utags.ko"

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

