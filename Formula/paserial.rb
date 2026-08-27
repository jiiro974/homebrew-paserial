class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.9/paserial-darwin-arm64"
      sha256 "346028a214bec5692dd7d5c15d363f11465f67139c9bdc92743acceb4c6fc9bd"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.9/paserial-darwin-amd64"
      sha256 "b12785c09e86fe8a3ccc67bad6205d12c618999926fce47021c9f23e5b6157e7"
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
