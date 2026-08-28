class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.18/paserial-darwin-arm64"
      sha256 "31b976b68d8e5c512c6e603b94f2820459fbf2c989991b398ac7492620e69aef"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.18/paserial-darwin-amd64"
      sha256 "ed4f4c07c5fc26ccbfed8e4a948189596e7bb9f039924d87b47fa8a0ed36b279"
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
