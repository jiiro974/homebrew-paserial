class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.13/paserial-darwin-arm64"
      sha256 "9f0f8b11ebc2dd343ffbd6705650bcd01d161a80e6bd05d05ac763c4ee625347"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.13/paserial-darwin-amd64"
      sha256 "767b74d1d6ddaa829b126101ff92fa7064e77fcce65e46890b04926b1f2a32cb"
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
