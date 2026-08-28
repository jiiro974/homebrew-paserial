class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.20/paserial-darwin-arm64"
      sha256 "65d8c119fd1641767b3be239d884b12179f7b4eb24abf1c71f14bc652f8dc0b1"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.20/paserial-darwin-amd64"
      sha256 "7452ac55f0124ffbe2fbe7da2626c66af0f53381f4ab1d9bf28e37c8c1aef1fd"
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
