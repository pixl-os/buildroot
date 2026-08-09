################################################################################
#
# libsoundtouch
#
################################################################################

LIBSOUNDTOUCH_VERSION = 2.4.1
LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
LIBSOUNDTOUCH_AUTORECONF = YES
LIBSOUNDTOUCH_INSTALL_STAGING = YES

# pixl - enabled soundtouch dll headers
LIBSOUNDTOUCH_CONF_OPTS += -DSOUNDTOUCH_DLL=ON

# pixl - use cmake for duckstation package lookup
$(eval $(cmake-package))
