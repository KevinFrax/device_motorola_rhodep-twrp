#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
# Copyright (C) 2019-Present A-Team Digital Solutions
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), rhodep)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
