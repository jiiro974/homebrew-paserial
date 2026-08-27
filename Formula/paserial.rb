class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.11/paserial-darwin-arm64"
      sha256 "690bcc764f37228cf58ae1b524496ef1eb021bac4af8ed2e9ff88cb5ae90bbb0"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.11/paserial-darwin-amd64"
      sha256 "90fa4aadac162cd0b3336f01a116a8227cd7be8cab4147f98a4825c990fd8bb2"
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
