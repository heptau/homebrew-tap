class Pgarachne < Formula
  desc "High-performance PostgreSQL JSON-RPC gateway with SSE support"
  homepage "https://www.pgarachne.com/"
  version "3.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-darwin-arm64.zip"
      sha256 "10c3320fa4ca466ab8166c93232f9e0553cd5203ce061e19661f466b11b8bce6"
    else
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-darwin-amd64.zip"
      sha256 "6daf856583f4deaa8ec19ecdabb160c9683cb253a31a5169a0e6f991a3cb2b8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-linux-arm64.tar.gz"
      sha256 "0f6c3374d3bd5979c0583280e16548e1b500a436a13c7e85f2a8aa88c5ffecc9"
    else
      url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-linux-amd64.tar.gz"
      sha256 "e0c8778a6fbca472eeef5f9b985b44ee996df4276254f8936fe1a32d52f4d2c2"
    end
  end

  def install
    bin.install "pgarachne"
  end

  test do
    assert_match "PgArachne", shell_output("#{bin}/pgarachne --version")
  end
end
