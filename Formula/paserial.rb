class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.22/paserial-darwin-arm64"
      sha256 "0e973a38adda4379470c82c92b68848022b85b761ba6d59d6536b9874a1bb349"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.22/paserial-darwin-amd64"
      sha256 "6cb75403e2be47a509adfb81596acf2b62780e7f8dc1712e6753701ac183dad7"
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
