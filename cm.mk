# Include CDMA stuff
$(call inherit-product, vendor/cm/config/cdma.mk)

# Inherit device configuration for gelato.
$(call inherit-product, device/lge/gelato/gelato.mk)

TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320
$(call inherit-product, vendor/cm/config/mini.mk)

PRODUCT_NAME := cm_gelato
PRODUCT_BRAND := lge
PRODUCT_DEVICE := gelato
PRODUCT_MODEL := vm701
PRODUCT_MANUFACTURER := LGE
PRODUCT_CHARACTERISTICS := phone

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=lge_vm701

# Release name and versioning
PRODUCT_RELEASE_NAME := OptimusSlider
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk
