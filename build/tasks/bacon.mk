# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
# Copyright (C) 2026 The Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# Nexus OTA update package

NEXUS_TARGET_PACKAGE := $(PRODUCT_OUT)/nexus-$(NEXUS_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

$(NEXUS_TARGET_PACKAGE): $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(NEXUS_TARGET_PACKAGE)
	$(hide) $(SHA256) $(NEXUS_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(NEXUS_TARGET_PACKAGE).sha256sum
	@echo "Package Complete: $(NEXUS_TARGET_PACKAGE)" >&2

.PHONY: bacon
bacon: $(NEXUS_TARGET_PACKAGE) $(DEFAULT_GOAL)

# -----------------------------------------------------------------
# Nexus fastboot image package

NEXUS_IMG_PACKAGE := $(PRODUCT_OUT)/nexus-$(NEXUS_VERSION)-img.zip

$(NEXUS_IMG_PACKAGE): $(INTERNAL_UPDATE_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_UPDATE_PACKAGE_TARGET) $(NEXUS_IMG_PACKAGE)
	$(hide) $(SHA256) $(NEXUS_IMG_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(NEXUS_IMG_PACKAGE).sha256sum
	@echo "IMG Package: $(NEXUS_IMG_PACKAGE)" >&2

.PHONY: bacon-img
bacon-img: $(DEFAULT_GOAL) $(NEXUS_IMG_PACKAGE)
