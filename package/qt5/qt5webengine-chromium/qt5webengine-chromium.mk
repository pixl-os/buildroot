################################################################################
#
# qt5webengine-chromium
#
################################################################################
# Version bumped for QT5 WEBENGINE as identified on following repo using 5.15.10 tags:
# https://invent.kde.org/qt/qt/qtwebengine/-/tree/v5.15.10-lts/
# and the third-party module commit linked:
# https://invent.kde.org/qt/qt/qtwebengine-chromium/-/tree/caba2fcb0fe8a8d213c4c79d26da3bb88eee61c7/
QT5WEBENGINE_CHROMIUM_VERSION = caba2fcb0fe8a8d213c4c79d26da3bb88eee61c7
QT5WEBENGINE_CHROMIUM_SITE = $(QT5_SITE)/qtwebengine-chromium/-/archive/$(QT5WEBENGINE_CHROMIUM_VERSION)
QT5WEBENGINE_CHROMIUM_SOURCE = qtwebengine-chromium-$(QT5WEBENGINE_CHROMIUM_VERSION).tar.bz2
QT5WEBENGINE_CHROMIUM_PATCH_DEPENDENCIES = qt5webengine-chromium-catapult
QT5WEBENGINE_CHROMIUM_INSTALL_TARGET = NO

include package/qt5/qt5webengine-chromium/chromium-latest.inc

QT5WEBENGINE_CHROMIUM_LICENSE = BSD-3-Clause, GPL-2.0 or LGPL-3.0 or GPL-3.0 or GPL-3.0 with exception

define QT5WEBENGINE_CHROMIUM_COPY_CATAPULT
	rm -rf $(@D)/chromium/third_party/catapult
	cp -a $(QT5WEBENGINE_CHROMIUM_CATAPULT_DIR) $(@D)/chromium/third_party/catapult
endef
QT5WEBENGINE_CHROMIUM_POST_PATCH_HOOKS += QT5WEBENGINE_CHROMIUM_COPY_CATAPULT

$(eval $(generic-package))
