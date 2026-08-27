class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.12/paserial-darwin-arm64"
      sha256 "008f235c08a3914909b6baf4e58f908d57bb57af6a198dea0154573ee21bd644"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.12/paserial-darwin-amd64"
      sha256 "1629cef19b4f28fdf8341410c5d597ed6673e0a968362911958387a0769e7d98"
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
