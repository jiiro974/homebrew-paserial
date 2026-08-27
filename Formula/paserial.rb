class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.2/paserial-darwin-arm64"
      sha256 "a64fefbd4a4571e2f9b3949495abb190c62199ea88f68f93bd1934c21ed4a5f0"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.2/paserial-darwin-amd64"
      sha256 "92a9bef8b1dcb4e32f543d97935b1a29ca837457ae25aafd203e7331ff88150f"
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
