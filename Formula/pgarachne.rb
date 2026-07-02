class Pgarachne < Formula
  desc "High-performance PostgreSQL JSON-RPC gateway with SSE support"
  homepage "https://www.pgarachne.com/"
  version "2.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-darwin-arm64.zip"
      sha256 "1b20f3bf634e9ddfc21cb260d3dc01f0b3c17fdd81b640b4252ff5342f18aa73"
    else
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-darwin-amd64.zip"
      sha256 "7399da8b5fffc055a7347480378d38f4b6b1a8cbd0ebb8b01d8f03d814f62a8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-linux-arm64.tar.gz"
      sha256 "d00276158165f74ff806d632e6373486f9a13ea482be1b05fcf6c990a03b2ef2"
    else
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-linux-amd64.tar.gz"
      sha256 "d50bcd6317d106efa57af397e8e26aad39630a674348e924c5ec63c55d58540e"
    end
  end

  def install
    bin.install "pgarachne"
  end

  test do
    assert_match "PgArachne", shell_output("#{bin}/pgarachne --version")
  end
end
