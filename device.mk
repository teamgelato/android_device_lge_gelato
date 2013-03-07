#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
#
# We're on Sprint (well, Virgin Mobile)
# http://en.wikipedia.org/wiki/Mobile_Network_Code
# Set this properly so that Android Marketplace gets
# this right.

DEVICE_PACKAGE_OVERLAYS := device/lge/gelato/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
    device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf \
    device/lge/gelato/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/gelato/tun.ko:system/lib/modules/tun.ko \
    device/lge/gelato/wireless.ko:system/lib/modules/wireless.ko

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    device/lge/gelato/init.rc:root/init.rc \
    device/lge/gelato/init.gelato.rc:root/init.gelato.rc \
    device/lge/gelato/ueventd.gelato.rc:root/ueventd.gelato.rc \
    device/lge/gelato/init.local.rc:/system/etc/init.local.rc \
    device/lge/gelato/init.qcom.rc:root/init.qcom.rc \
    device/lge/gelato/init.qcom.sh:root/init.qcom.sh

PRODUCT_PACKAGES += \
    bdaddr_read \
    libcamera

DISABLE_DEXPREOPT := false
  
# Kernel
LOCAL_KERNEL := device/lge/gelato/zImage
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Telephony Properties for CDMA VM:
#PRODUCT_PROPERTY_OVERRIDES += \
#   ro.ril.def.preferred.network=4 \
#   ro.telephony.default_network=4 \
#   ro.cdma.home.operator.alpha=Virgin Mobile \
#   ro.cdma.home.operator.subscriber=31000 \
#   ro.cdma.home.operator.numeric=311490 \
#   gsm.sim.operator.alpha = Virgin Mobile \
#   gsm.sim.operator.numeric = 311490 \
#   gsm.sim.operator.iso-country = us \
#   gsm.operator.alpha = Virgin Mobile \
#   gsm.operator.numeric = 311490 \
#   gsm.operator.iso-country = us \
#   gsm.sim.state=READY

# Telephony for CDMA Virgin Mobile:

CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490
BLUETOOTH_FIRMWARE := BCM4330B1_002.001.003.0221.0235.hcd
SUB_MODEL := VM701

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=eth0 \
       wifi.supplicant_scan_interval=120 \
       dalvik.vm.heapsize=32m \
       dalvik.vm.dexopt-data-only=1 \
       ro.opengles.version=65537

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/lge/gelato/device-vendor.mk)
