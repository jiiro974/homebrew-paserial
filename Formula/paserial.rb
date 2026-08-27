class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.2.1rc1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v#{version}/paserial-darwin-arm64"
      sha256 "b4e26c170b7bc7b52dc789afc82dfa2f5e8fdf394ef403879b730cabf370bfd4"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v#{version}/paserial-darwin-amd64"
      sha256 "a3efe315af6d1a9e199232194026b97525488ce35ff15873e59cb80ff8acd48a"
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
