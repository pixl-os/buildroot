################################################################################
#
# qt5xmlpatterns
#
################################################################################

QT5XMLPATTERNS_VERSION = 30e6c84fe2752cde8b53aff9d38c2095cd7c8761
QT5XMLPATTERNS_SITE = $(QT5_SITE)/qtxmlpatterns/-/archive/$(QT5XMLPATTERNS_VERSION)
QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5XMLPATTERNS_VERSION).tar.bz2
QT5XMLPATTERNS_INSTALL_STAGING = YES
QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
QT5XMLPATTERNS_SYNC_QT_HEADERS = YES

#added here to force build of pegasus after QT5 build if requested (to avoid qmake issue with qt6 package build after)
ifeq ($(BR2_PACKAGE_PEGASUS),y)
QT5XMLPATTERNS_DEPENDENCIES += pegasus
endif

# Added dolphin-triforce to force use qt5 on qt6.6.1 update (to avoid qmake issue with qt6 package build after)
ifeq ($(BR2_PACKAGE_DOLPHIN_TRIFORCE),y)
QT5XMLPATTERNS_DEPENDENCIES += dolphin-triforce
endif

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5XMLPATTERNS_DEPENDENCIES += qt5declarative
endif

ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
endif

ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
QT5XMLPATTERNS_CONF_OPTS += "QMAKE_CXXFLAGS+=-O0"
endif

# Fix to have /usr/qml directories/files  to /usr/qml/qt5 as requested
define QT5XMLPATTERNS_QT5QMLMOVE
	mv $(TARGET_DIR)/usr/qml $(TARGET_DIR)/usr/qt5
	mkdir -p $(TARGET_DIR)/usr/qml
	mv -f $(TARGET_DIR)/usr/qt5 $(TARGET_DIR)/usr/qml/qt5
endef
QT5XMLPATTERNS_POST_INSTALL_TARGET_HOOKS += QT5XMLPATTERNS_QT5QMLMOVE

$(eval $(qmake-package))
