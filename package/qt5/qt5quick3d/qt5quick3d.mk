################################################################################
#
# qt5quick3d
#
################################################################################

# from tag v5.15.14-lts-lgpl 
QT5QUICK3D_VERSION = c1909714d0bf1314470211808f729337a6a3b1a4
QT5QUICK3D_SITE = $(QT5_SITE)/qtquick3d/-/archive/$(QT5QUICK3D_VERSION)
QT5QUICK3D_SOURCE = qtquick3d-$(QT5QUICK3D_VERSION).tar.bz2
QT5QUICK3D_DEPENDENCIES = qt5declarative
QT5QUICK3D_INSTALL_STAGING = YES
QT5QUICK3D_SYNC_QT_HEADERS = YES

QT5QUICK3D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
QT5QUICK3D_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.LGPL3 LICENSE.FDL

$(eval $(qmake-package))