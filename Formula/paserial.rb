class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.27/paserial-darwin-arm64"
      sha256 "485c7b5cd55b27a34ab4e358a4ad08941c1e5c1e4853122a8e8c91285872845f"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.27/paserial-darwin-amd64"
      sha256 "2b21450b7b6c89fde198b820f721ad12039865451c3bf9491c833b4da3b02eaa"
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
