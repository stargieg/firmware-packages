include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-berlin-statistics-defaults
PKG_VERSION:=0.0.2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-berlin-statistics-defaults
  SECTION:=freifunk-berlin
  CATEGORY:=freifunk-berlin
  TITLE:=Freifunk Berlin statistics default configuration
  URL:=http://github.com/freifunk-berlin/packages_berlin
  DEPENDS+= +olsrd-mod-txtinfo +freifunk-berlin-lib-guard
  PKGARCH:=all
endef

define Package/freifunk-berlin-statistics-defaults/description
  Freifunk Berlin configuration files for statistics
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-berlin-statistics-defaults/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(CP) ./uci-defaults/* $(1)/etc/uci-defaults
endef

$(eval $(call BuildPackage,freifunk-berlin-statistics-defaults))
