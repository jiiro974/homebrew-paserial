class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.4/paserial-darwin-arm64"
      sha256 "155730b9ce80e22799b2e67e7c4880568ca23fd4756846d552ed284230c05d2c"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.4/paserial-darwin-amd64"
      sha256 "008e058fe02821703e16ca416f7916fbc20546dcc4e356f611e72b81f2d3034f"
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
