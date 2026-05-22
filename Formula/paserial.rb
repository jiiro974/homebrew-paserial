class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.2.0/paserial-darwin-arm64"
      sha256 "ced5d159e717263e2da9b9910e4a7805f2367a0e554d4d71612bdba34aabd9ad"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.2.0/paserial-darwin-amd64"
      sha256 "d8db68b656606f9aee90e6a5009f0d88fb4c0a297329d0972e282d77599d3434"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "paserial-darwin-\#{arch}" => "paserial"
  end

  test do
    assert_match "paserial \#{version}", shell_output("\#{bin}/paserial version")
  end
end
