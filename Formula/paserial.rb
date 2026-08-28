class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.19/paserial-darwin-arm64"
      sha256 "469c13fead65dd9b63863ac3d2b342924ec403a37e5879f4cfad2396d59029b6"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.19/paserial-darwin-amd64"
      sha256 "3f0ed1dbab9b897d67e8e1848583898a8f21bfb402a40c1cd06bd2267f0a0661"
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
