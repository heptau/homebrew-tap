class Pgarachne < Formula
  desc "High-performance PostgreSQL JSON-RPC gateway with SSE support"
  homepage "https://www.pgarachne.com/"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-darwin-arm64.zip"
      sha256 "0e526234bf88faca4e23f9fabdd9c9ab1f1b1af3aaee1ee037899f7e254141f0"
    else
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-darwin-amd64.zip"
      sha256 "e3e66f2982722ec3aa861a3f328421777b42e126d86b2f149204fbdeef26c934"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-linux-arm64.tar.gz"
      sha256 "c43ad37f9867715d5a9357e3dc0ca0bbba98b988cdbe9cfe6f2247fe7d85607d"
    else
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-linux-amd64.tar.gz"
      sha256 "b171216aab57ba73299f6b28da4d624a60ce9317dde7a3c21d8888c4e917655d"
    end
  end

  def install
    bin.install "pgarachne"
  end

  test do
    assert_match "PgArachne", shell_output("#{bin}/pgarachne --version")
  end
end
