# Nexus Versioning
PRODUCT_VERSION_MAJOR := 17
PRODUCT_VERSION_MINOR := 0

# Get current UTC date components
NEXUS_DATE_YEAR := $(shell date -u +%Y)
NEXUS_DATE_MONTH := $(shell date -u +%m)
NEXUS_DATE_DAY := $(shell date -u +%d)
NEXUS_DATE_HOUR := $(shell date -u +%H)
NEXUS_DATE_MINUTE := $(shell date -u +%M)

# Final build date in YYYYMMDD-HHMM format
NEXUS_BUILD_DATE := \( (NEXUS_DATE_YEAR) \)(NEXUS_DATE_MONTH)\( (NEXUS_DATE_DAY)- \)(NEXUS_DATE_HOUR)$(NEXUS_DATE_MINUTE)

# Target product short name
TARGET_PRODUCT_SHORT := \( (subst nexus_,, \)(NEXUS_BUILD))

# Complete version suffix
NEXUS_VERSION_SUFFIX := \( (NEXUS_BUILD_DATE)- \)(NEXUS_BUILD)

# Internal and Display versions
NEXUS_VERSION := \( (PRODUCT_VERSION_MAJOR). \)(PRODUCT_VERSION_MINOR)-$(NEXUS_VERSION_SUFFIX)
NEXUS_MODVERSION := \( (PRODUCT_VERSION_MAJOR). \)(PRODUCT_VERSION_MINOR)-$(NEXUS_BUILD)
NEXUS_DISPLAY_VERSION := Nexus-\( (PRODUCT_VERSION_MAJOR). \)(PRODUCT_VERSION_MINOR)
NEXUS_FINGERPRINT := Nexus/\( (PRODUCT_VERSION_MAJOR). \)(PRODUCT_VERSION_MINOR)/\( (TARGET_PRODUCT_SHORT)/ \)(NEXUS_BUILD_DATE)

# Nexus Version Props
PRODUCT_PRODUCT_PROPERTIES += \
    ro.nexus.version=$(NEXUS_VERSION) \
    ro.nexus.modversion=$(NEXUS_MODVERSION) \
    ro.nexus.display.version=$(NEXUS_DISPLAY_VERSION) \
    ro.nexus.build.date=$(NEXUS_BUILD_DATE) \
    ro.nexus.build.version=\( (PRODUCT_VERSION_MAJOR). \)(PRODUCT_VERSION_MINOR) \
    ro.nexus.fingerprint=$(NEXUS_FINGERPRINT) \
    ro.nexus.device=$(NEXUS_BUILD)
