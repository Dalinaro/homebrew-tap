cask "ttvpn" do
  version "1.14"
  sha256 "0e060c0baf957fa11db6c18a66b0cd70fee9218600e0328429d56a88a7f9e3e9"

  url "https://github.com/Dalinaro/ttvpn/releases/download/v#{version}/TT-Vpn.dmg"
  name "TT Vpn"
  desc "Menu-bar VPN client for macOS (OpenConnect/OpenVPN/IPsec)"
  homepage "https://github.com/Dalinaro/ttvpn"

  auto_updates true
  depends_on macos: :ventura

  app "TT Vpn.app"

  caveats <<~CAVEATS
    TT Vpn is not notarized by Apple, so macOS will warn on first launch.
    Easiest: install with the quarantine flag disabled:

      brew install --cask --no-quarantine Dalinaro/tap/ttvpn

    If you already installed and see the warning, either run
      xattr -dr com.apple.quarantine "/Applications/TT Vpn.app"
    or go to System Settings -> Privacy & Security -> "Open Anyway".

    Then in the app: menu bar icon -> "Open settings..." -> "Install engines"
    (one admin password).

    Before uninstalling, open TT Vpn -> Settings -> "Remove engines" to clean up
    the root-installed VPN engines and the sudoers rule (needs your admin password).
  CAVEATS

  zap trash: "~/.config/vpn"
end
