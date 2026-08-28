class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.17/paserial-darwin-arm64"
      sha256 "f1cbfde8f89d67db7c7a1b81cb8458ecccbe5b8c837e9f49ae4a49cc32067b50"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.17/paserial-darwin-amd64"
      sha256 "afa583848bc008fcbefbf2f889e25669b445494f2d009658808f980a2e45ee11"
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
