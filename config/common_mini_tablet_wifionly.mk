# Inherit mobile mini common Lineage stuff
$(call inherit-product, vendor/nexus/config/common_mobile_mini.mk)

# Inherit tablet common Lineage stuff
$(call inherit-product, vendor/nexus/config/tablet.mk)

$(call inherit-product, vendor/nexus/config/wifionly.mk)
