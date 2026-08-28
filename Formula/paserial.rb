class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.25/paserial-darwin-arm64"
      sha256 "8a088d27ad8366803b394f311392486dcb779b1ac0d7bf85ad22941e20ea48e6"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.25/paserial-darwin-amd64"
      sha256 "e719a65c147c03bc20d26e0b412179e1e5afbc0083906465514bf0eb7c3c184d"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "paserial-darwin-#{arch}" => "paserial"
  end

  test do
    assert_match "paserial #{version}", shell_output("#{bin}/paserial version")
  end
end
