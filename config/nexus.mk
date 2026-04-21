# Enable aosp packages allowlist
PRODUCT_PACKAGES += initial-package-stopped-states-aosp.xml

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor

# Qualcomm Common
$(call inherit-product, device/qcom/common/common.mk)

# Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)
