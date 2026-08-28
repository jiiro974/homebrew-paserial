class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.24/paserial-darwin-arm64"
      sha256 "f87d4ba60c1518754d9a01717a7290c192f5a725fe0d7b878929f7ca8b04d49a"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.24/paserial-darwin-amd64"
      sha256 "fcf173fd1db17c5db9294c7b62dd60eeba2dd05342f224d0b8f988a46230dcc6"
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
