class Paserial < Formula
  desc "PAN-OS serial console CLI — automatise les commandes PAN-OS via console série"
  homepage "https://github.com/jiiro974/paserial-release"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.7/paserial-darwin-arm64"
      sha256 "4acbc0ee86e3e2bbc4890d626fb87421de9bd6e403e77fff88cc3f1fdfc0f6a2"
    else
      url "https://github.com/jiiro974/paserial-release/releases/download/v0.3.7/paserial-darwin-amd64"
      sha256 "dbccaa87c22155440395d9e9dd02cd62bd98e1071a3920d8e791bb1973a68c43"
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
