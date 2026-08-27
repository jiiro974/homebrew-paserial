class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.0/paserial-darwin-arm64"
      sha256 "86a28a11a7681e9161b1e36137f64b991f4e697e66cb6ffe1f48b0805c9738eb"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.0/paserial-darwin-amd64"
      sha256 "8987299b132316100d61c5be39c865bb3efe7d354dc79e5230382c2f6582ed75"
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
