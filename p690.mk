PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

$(call inherit-product, device/lge/msm7x27-common/device.mk)
$(call inherit-product-if-exists, vendor/lge/p690/p690-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p690/overlay

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qt602240_ts_input.kl:system/usr/keylayout/qt602240_ts_input.kl \
    $(LOCAL_PATH)/configs/gelato_keypad.kl:system/usr/keylayout/gelato_keypad.kl \
    $(LOCAL_PATH)/configs/gelato_keypad.kcm.bin:system/usr/keychars/gelato_keypad.kcm.bin \
    $(LOCAL_PATH)/configs/synaptics-rmi-ts.idc:system/usr/idc/synaptics-rmi-ts.idc \

# p690 init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.p690.rc:root/init.p690.rc \
    $(LOCAL_PATH)/ueventd.p690.rc:root/ueventd.p690.rc

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvram.txt:system/etc/wl/nvram.txt \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# P690 Audio
PRODUCT_PACKAGES += \
    audio_policy.p690 \
    audio.primary.p690 \
    camera.msm7x27 \

# Full-featured build of the Open-Source
$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := p690
PRODUCT_DEVICE := p690
PRODUCT_MODEL := LG-P690
