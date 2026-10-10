class Pgarachne < Formula
  desc "High-performance PostgreSQL JSON-RPC gateway with SSE support"
  homepage "https://www.pgarachne.com/"
  version "3.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-darwin-arm64.zip"
      sha256 "52ade83a7a89ad9583742a8d780149a872cc4ad849ddda0c5520b4c685e32f47"
    else
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-darwin-amd64.zip"
      sha256 "cf5d8a8462b75b3e551dbcc3509a56bb5205e4499469cfca6dbdd355b9f19afb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-linux-arm64.tar.gz"
      sha256 "e5f6a3db6cff2d37c8d6793343ffffaa2f5200cdf7ebfd30e404c267de3785d8"
    else
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-linux-amd64.tar.gz"
      sha256 "bb77d1a9974f4a49434924497d5a756c83224e5b7d387cf6fb22637045c42386"
    end
  end

  def install
    bin.install "pgarachne"
  end

  test do
    assert_match "PgArachne", shell_output("#{bin}/pgarachne --version")
  end
end
