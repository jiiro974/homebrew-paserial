class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.15/paserial-darwin-arm64"
      sha256 "aacd3893a3f214669fe19fe1f73763df4404c23cdcb831235f7c159368e3edfa"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.15/paserial-darwin-amd64"
      sha256 "bd523736128d593dfcc68fa63f309fbae53886f969f8eb7ad6288325d8aaa1fa"
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
