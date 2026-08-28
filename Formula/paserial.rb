class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.26/paserial-darwin-arm64"
      sha256 "442ffa8b732e6ddd98d69f2997b7ebb2e4167291878bd6f86ab1cf6c33be87b1"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.26/paserial-darwin-amd64"
      sha256 "0940c135764504d16cb7db55c42ebdc7e2ce37da74e0c1a0884ff9c68efec807"
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
