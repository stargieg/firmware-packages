include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-berlin-freifunk-defaults
PKG_VERSION:=0.0.2
PKG_RELEASE:=3

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-berlin-freifunk-defaults
  SECTION:=freifunk-berlin
  CATEGORY:=freifunk-berlin
  TITLE:=Freifunk Berlin freifunk default configuration
  URL:=http://github.com/freifunk-berlin/packages_berlin
  PKGARCH:=all
endef

define Package/freifunk-berlin-freifunk-defaults/description
  Freifunk Berlin configuration files for freifunk
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-berlin-freifunk-defaults/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(CP) ./uci-defaults/* $(1)/etc/uci-defaults
endef

$(eval $(call BuildPackage,freifunk-berlin-freifunk-defaults))
