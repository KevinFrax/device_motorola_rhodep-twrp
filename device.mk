#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
# Copyright (C) 2019-Present A-Team Digital Solutions
#

LOCAL_PATH := device/motorola/rhodep

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    
# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl-1.1-qti \
    libgptutils \
    bootctrl.holi \
    bootctrl.holi.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl 

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 31

# VNDK Level
PRODUCT_TARGET_VNDK_VERSION := 31

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Health HAL
PRODUCT_PACKAGES += \
	android.hardware.health@2.1-impl.recovery

# Screen
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080
#
## Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Crypto
#PRODUCT_PACKAGES += \
#    qcom_decrypt \
#    qcom_decrypt_fbe

# Copy Modules For TouchScreen

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/adapter_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/adapter_class.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/cw2217b_fg_mmi.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/cw2217b_fg_mmi.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/exfat.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/exfat.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_annotate.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_annotate.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_charger.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_charger.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_discrete_charger_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_discrete_charger_class.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_discrete_charger.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_discrete_charger.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_info.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_info.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_sys_temp.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_sys_temp.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/moto_f_usbnet.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/moto_f_usbnet.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/qpnp_adaptive_charge.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/qpnp_adaptive_charge.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/rt_pd_manager.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/rt_pd_manager.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/sensors_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/sensors_class.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/sgm4154x_charger.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/sgm4154x_charger.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/sm5602_fg_mmi.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/sm5602_fg_mmi.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/synaptics_tcm_core.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/synaptics_tcm_core.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/synaptics_tcm_device.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/synaptics_tcm_device.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/synaptics_tcm_diagnostics.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/synaptics_tcm_diagnostics.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/synaptics_tcm_i2c.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/synaptics_tcm_i2c.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/synaptics_tcm_recovery.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/synaptics_tcm_recovery.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/synaptics_tcm_reflash.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/synaptics_tcm_reflash.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/synaptics_tcm_spi.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/synaptics_tcm_spi.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/synaptics_tcm_testing.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/synaptics_tcm_testing.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/synaptics_tcm_touch.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/synaptics_tcm_touch.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/synaptics_tcm_zeroflash.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/synaptics_tcm_zeroflash.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/tcpc_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/tcpc_class.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/tcpc_sgm7220.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/tcpc_sgm7220.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/ldo_vibrator_mmi.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/ldo_vibrator_mmi.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/utags.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/utags.ko
