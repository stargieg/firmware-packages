include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-berlin-firewall-defaults
PKG_VERSION:=0.0.5
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-berlin-firewall-defaults
  SECTION:=freifunk-berlin
  CATEGORY:=freifunk-berlin
  TITLE:=Freifunk Berlin firewall default configuration
  URL:=http://github.com/freifunk-berlin/packages_berlin
  DEPENDS+= +firewall +freifunk-berlin-lib-guard
  PKGARCH:=all
endef

define Package/freifunk-berlin-firewall-defaults/description
  Freifunk Berlin configuration files for firewall
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-berlin-firewall-defaults/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(CP) ./uci-defaults/* $(1)/etc/uci-defaults
endef

$(eval $(call BuildPackage,freifunk-berlin-firewall-defaults))
