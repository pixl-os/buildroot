################################################################################
#
# vulkan-loader
#
################################################################################

VULKAN_LOADER_VERSION = $(VULKAN_HEADERS_VERSION)
VULKAN_LOADER_SITE = $(call github,KhronosGroup,Vulkan-Loader,v$(VULKAN_LOADER_VERSION))
VULKAN_LOADER_LICENSE = Apache-2.0
VULKAN_LOADER_LICENSE_FILES = LICENSE.txt
VULKAN_LOADER_INSTALL_STAGING = YES

VULKAN_LOADER_DEPENDENCIES = host-pkgconf vulkan-headers vulkan-tools

VULKAN_LOADER_CONF_OPTS += \
	-DASSEMBLER_WORKS=FALSE \
	-DBUILD_WSI_SCREEN_QNX_SUPPORT=OFF \
	-DLOADER_CODEGEN=OFF

ifeq ($(BR2_PACKAGE_DIRECTFB),y)
VULKAN_LOADER_DEPENDENCIES += directfb
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=ON
else
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_DIRECTFB_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_LIBXCB),y)
VULKAN_LOADER_DEPENDENCIES += libxcb
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
else
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRANDR),yy)
VULKAN_LOADER_DEPENDENCIES += xlib_libX11 xlib_libXrandr
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=ON
else
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
VULKAN_LOADER_DEPENDENCIES += wayland
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=ON
else
VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=OFF
endif

$(eval $(cmake-package))
