class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.10/paserial-darwin-arm64"
      sha256 "92e90d0390d75b2775d04394cd129e49e63e50752861eb983d4ace3054a8e210"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.10/paserial-darwin-amd64"
      sha256 "10a57f5ad26f443de4bbcc3151297341fb46cb3ac765893c4a66c1f96e35de76"
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
