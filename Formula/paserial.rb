class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.21/paserial-darwin-arm64"
      sha256 "4bfd212c287c06e69bb48a9e38b8e0d73b856743425e585a018c6258f25e487d"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.21/paserial-darwin-amd64"
      sha256 "700ebe2f4276eab76eee1d64406f3b8c7ef9d56d48f0612974e22deb330035f7"
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
