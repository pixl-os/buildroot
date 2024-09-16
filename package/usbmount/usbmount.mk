################################################################################
#
# usbmount
#
################################################################################

USBMOUNT_VERSION = 0.0.22
USBMOUNT_SOURCE = usbmount_$(USBMOUNT_VERSION).tar.gz
USBMOUNT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/u/usbmount
USBMOUNT_DEPENDENCIES = udev lockfile-progs
USBMOUNT_LICENSE = BSD-2-Clause
USBMOUNT_LICENSE_FILES = debian/copyright

define USBMOUNT_INSTALL_TARGET_CMDS
	# pixl add sed usbmount.conf for many format
	$(SED) 's|^FILESYSTEMS=.*|FILESYSTEMS="vfat ext2 ext3 ext4 hfsplus ntfs exfat"|g' $(@D)/usbmount.conf
	$(SED) 's|/media/usb|/recalbox/share/externals/usb|g' $(@D)/usbmount.conf
	$(SED) 's|/usr/share/usbmount/usbmount add|/recalbox/scripts/recalbox-usbmount.sh add %k|g' $(@D)/usbmount.rules
	$(SED) 's|/usr/share/usbmount/usbmount remove|/recalbox/scripts/recalbox-usbmount.sh remove %k|g' $(@D)/usbmount.rules
	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount

	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink \
		$(TARGET_DIR)/etc/usbmount/mount.d/00_create_model_symlink
	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink \
		$(TARGET_DIR)/etc/usbmount/umount.d/00_remove_model_symlink

	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
	$(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf

	# pixl change dir /media/usb
	mkdir -p $(addprefix $(TARGET_DIR)/recalbox/share_init/externals/usb,0 1 2 3 4 5 6 7)
endef

$(eval $(generic-package))
