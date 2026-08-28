class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.23/paserial-darwin-arm64"
      sha256 "c0b4a6d7d0871db3c5400d688490723f01623927760f489bb61ac5e0123ba6d2"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.23/paserial-darwin-amd64"
      sha256 "a96ad35933e3dbbfaede403321a26f041819f0fecc4ae8c24657f87ba9f4e792"
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
