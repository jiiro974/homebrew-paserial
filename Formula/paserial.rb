class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.28/paserial-darwin-arm64"
      sha256 "8c81acfe3a8ea6c0b3860bde4ba6a70f1a28a062be098167042247d624d3ef7e"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.28/paserial-darwin-amd64"
      sha256 "645a32fa9d97b9be21fbb78855cdda13a65587b2a94b8dd1167829a1a02ea331"
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
