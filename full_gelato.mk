# Note: this needs to be called from the device specific thunderc_AANNN.mk file
# *AFTER* SUB_MODEL, CDMA_GOOGLE_BASE, CDMA_CARRIER_ALPHA, CDMA_CARRIER_NUMERIC,
# and BLUETOOTH_FIRMWARE have been defined.

#
# This file is the build configuration for a full Android
# build for gelato hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

PRODUCT_COPY_FILES += \
    device/lge/gelato/apns-conf.xml:system/etc/apns-conf.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Call the common thunderc stuff first to avoid a lot of duplication.
$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, device/lge/gelato/device.mk)

# We don't need to pull in the languages_full.mk manually because it'll get clobbered anyhow by full.mk
# mdpi goes last so that the janky default locale/region code can pick a sane default
PRODUCT_LOCALES += mdpi

PRODUCT_NAME := full_gelato
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := gelato
PRODUCT_MANUFACTURER := LGE

