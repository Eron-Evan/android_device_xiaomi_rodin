#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Inherit from rodin device
$(call inherit-product, device/xiaomi/rodin/device.mk)
TARGET_SHIPS_MIUICAMERA := true

PRODUCT_DEVICE := rodin
PRODUCT_NAME := lineage_rodin
PRODUCT_BRAND := POCO
PRODUCT_MODEL := 2412DPC0AG
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_BRAND_FOR_ATTESTATION := $(PRODUCT_BRAND)
PRODUCT_DEVICE_FOR_ATTESTATION := $(PRODUCT_DEVICE)
PRODUCT_MODEL_FOR_ATTESTATION := $(PRODUCT_MODEL)
PRODUCT_NAME_FOR_ATTESTATION := rodin_eea
PRODUCT_MANUFACTURER_FOR_ATTESTATION := $(PRODUCT_MANUFACTURER)

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="missi-user 16 BP2A.250605.031.A3 16OS3.1.260413.104217578.MTPEGL.S release-keys" \
    BuildFingerprint=POCO/rodin_eea/rodin:16/BP2A.250605.031.A3/OS3.0.300.0.WOJEUXM:user/release-keys \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME) \
    SystemDevice=$(PRODUCT_SYSTEM_DEVICE) \
    SystemName=$(PRODUCT_SYSTEM_NAME)

# AOSP Flags
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_FACE_UNLOCK_SUPPORTED := true
EXTRA_UDFPS_ANIMATIONS := true
TORCH_STR_SUPPORTED := true
TARGET_ENABLE_BLUR := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_INCLUDE_WEATHER := true
TARGET_SUPPORTS_GOOGLE_FILES := true
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_SHIPS_BCR := true
TARGET_SUPPORTS_GOOGLE_TELEPHONY := false
TARGET_OPTIMIZED_DEXOPT := true
WITH_BCR := true
TARGET_CUSTOM_UDFPS := true
WITH_GMS_COMMS_SUITE := true
TARGET_ENABLE_BLUR := true

# Infinity-X Specific Flags
INFINITY_MAINTAINER := ERON
WITH_GAPPS := true
USE_MOTO_CALCULATOR := true
TARGET_BUILD_VIMUSIC := true

# Inherit some extras stuff
$(call inherit-product-if-exists, vendor/extras/extras.mk)
