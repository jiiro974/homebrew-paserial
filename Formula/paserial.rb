class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.14/paserial-darwin-arm64"
      sha256 "31b01cd38726ab29f84cad2920df5a99780c5c1c7e082b263f055ab8b90ed6ff"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.14/paserial-darwin-amd64"
      sha256 "cb336dfa4cbe681b4aff2dca145748de0c8df4835b6072029e85e8586f914820"
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
