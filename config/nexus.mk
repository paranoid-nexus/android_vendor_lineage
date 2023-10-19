# Enable aosp packages allowlist
PRODUCT_PACKAGES += initial-package-stopped-states-aosp.xml

# Qualcomm Common
$(call inherit-product, device/qcom/common/common.mk)

# Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)
