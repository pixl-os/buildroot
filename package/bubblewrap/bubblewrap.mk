################################################################################
#
# bubblewrap
#
################################################################################

BUBBLEWRAP_VERSION = 0.11.0
BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap

BUBBLEWRAP_LICENSE = LGPL-2.0+
BUBBLEWRAP_LICENSE_FILES = COPYING
BUBBLEWRAP_CPE_ID_VENDOR = projectatomic

BUBBLEWRAP_CONF_OPTS = \
	-Dzsh_completion=disabled \
	-Dman=disabled \
	-Dpython=$(HOST_DIR)/bin/python \
	-Drequire_userns=false \
	-Dtests=false

ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
BUBBLEWRAP_CONF_OPTS += \
	-Dbash_completion=enabled \
	-Dbash_completion_dir=/usr/share/bash-completion/completions
else
BUBBLEWRAP_CONF_OPTS += -Dbash_completion=disabled
endif

ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
BUBBLEWRAP_CONF_OPTS += -Dselinux=enabled
BUBBLEWRAP_DEPENDENCIES += libselinux
else
BUBBLEWRAP_CONF_OPTS += -Dselinux=disabled
endif

# We need to mark bwrap as setuid, in case the kernel
# has user namespaces disabled for non-root users.
define BUBBLEWRAP_PERMISSIONS
	/usr/bin/bwrap f 1755 0 0 - - - - -
endef

$(eval $(meson-package))
