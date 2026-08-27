class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.8/paserial-darwin-arm64"
      sha256 "eae34ed0f24012ea7e3ba9111622e369e8df6fddcc6d62b4e050a218762a0205"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.8/paserial-darwin-amd64"
      sha256 "52d89c9f23d6caacef5a21363a9431592d81a569ffec2c213ee00649bbbd0c13"
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
