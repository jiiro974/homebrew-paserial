class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v#{version}/paserial-darwin-arm64"
      sha256 "d7c1018359fe760087b77510b833ff15be89f26cbd7c4c6271f632c70ff616ab"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v#{version}/paserial-darwin-amd64"
      sha256 "787ee9a0dce8dad4a7ae24ea5a8f625ef8627b7113d6f9e57a2c8a5e0c279e6d"
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
