class Pgarachne < Formula
  desc "High-performance PostgreSQL JSON-RPC gateway with SSE support"
  homepage "https://www.pgarachne.com/"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-darwin-arm64.zip"
      sha256 "c73db21c03a282aa364bb253182edb2fcb4cb827b4974609f290b047a00264c0"
    else
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-darwin-amd64.zip"
      sha256 "d9a0d9158560c126d572aee62cda692a30ab4474e9dac9d4fa149da11c6c492c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-linux-arm64.tar.gz"
      sha256 "0670190c63fe43c6bf368574b5a6bdbf363ffdbe9c951b2eeb6f9c28004f027c"
    else
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-linux-amd64.tar.gz"
      sha256 "b0dba5f03f7bdf2adf5f7b2320d3ca7da10d41eef66d8e0dddac0d0b51e926e7"
    end
  end

  def install
    bin.install "pgarachne"
  end

  test do
    assert_match "PgArachne", shell_output("#{bin}/pgarachne --version")
  end
end
