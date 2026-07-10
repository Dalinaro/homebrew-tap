cask "ttvpn" do
  version "1.28"
  sha256 "11bbf6598b5dcc542498dae5ffef7d800393973f73508d7a6e8f4ddfa37ab866"

  url "https://github.com/Dalinaro/ttvpn/releases/download/v#{version}/TT-Vpn.dmg"
  name "TT Vpn"
  desc "Menu-bar VPN client for macOS (OpenConnect/OpenVPN/IPsec)"
  homepage "https://github.com/Dalinaro/ttvpn"

  auto_updates true
  depends_on macos: :ventura

  app "TT Vpn.app"

  caveats <<~CAVEATS
    After launching: menu bar icon -> "Open settings..." -> "Install engines"
    (one admin password).

    Before uninstalling, open TT Vpn -> Settings -> "Remove engines" to clean up
    the root-installed VPN engines and the sudoers rule (needs your admin password).
  CAVEATS

  zap trash: "~/.config/vpn"
end
