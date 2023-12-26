################################################################################
#
# qt6
#
################################################################################

QT6_VERSION_MAJOR = 6.6
QT6_VERSION = $(QT6_VERSION_MAJOR).1
QT6_SOURCE_TARBALL_PREFIX = everywhere-src
QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules

include $(sort $(wildcard package/qt6/*/*.mk))

# The file "qt.conf" can be used to override the hard-coded paths especially by QT5
# we have to remove it to avoid issues in case of QT6
define QT6_INSTALL_QT_CONF
	rm -f $(HOST_DIR)/bin/qt.conf
endef

define QT6_QT_CONF_FIXUP
	$(QT6_INSTALL_QT_CONF)
endef
