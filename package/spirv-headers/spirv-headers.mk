################################################################################
#
# spirv-headers
#
################################################################################

# Keep in sync with spirv-tools version
SPIRV_HEADERS_VERSION = vulkan-sdk-1.3.280.0
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE
SPIRV_HEADERS_DEPENDENCIES = host-python3
SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
