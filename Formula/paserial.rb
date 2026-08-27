class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.6/paserial-darwin-arm64"
      sha256 "519f257d8edeb09fabb4aef88e99670a11039ff60a07586c21d678dfb4580350"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.6/paserial-darwin-amd64"
      sha256 "19f5f93da676655f07be084cc9de3610b6e54e966c17970212b6e5426374a345"
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
