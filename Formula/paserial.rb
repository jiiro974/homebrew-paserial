class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.5/paserial-darwin-arm64"
      sha256 "7108ea4df1c02139af8fe03e8d21b71030ce11fe669eeaee1fa59fc0ae826cb6"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.5/paserial-darwin-amd64"
      sha256 "ce413e71d65f655ee2e02cdca5e3fe21b6ecfd55b78ad836526e007750f10d31"
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
