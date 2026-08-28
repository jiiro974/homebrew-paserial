class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.16/paserial-darwin-arm64"
      sha256 "1281b665bece2135f38970770d4223947bffbea4b2683a30a7311b395f44f2d6"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.16/paserial-darwin-amd64"
      sha256 "65cd1c73b894e835e23323779a82c524785fef0a4d1c27cd834a40709347bdce"
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
