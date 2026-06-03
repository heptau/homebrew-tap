class PgAtropos < Formula
  desc "PostgreSQL custom-format dump splitter for GIT"
  homepage "https://github.com/heptau/pg_atropos"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pg_atropos/releases/download/v1.0.0/pg_atropos-1.0.0-darwin-arm64.tar.gz"
      sha256 "6731c9c50491ca9ec58c23f38d277053fb413797bc03b3613cee795ec883eb88"
    else
      url "https://github.com/heptau/pg_atropos/releases/download/v1.0.0/pg_atropos-1.0.0-darwin-amd64.tar.gz"
      sha256 "3e3c0cf44073e7d4e3944af5b193cfb91d9f8643a73366517ce2b0dd5e14b298"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pg_atropos/releases/download/v1.0.0/pg_atropos-1.0.0-linux-arm64.tar.gz"
      sha256 "227be463e20806073a032801b94d03b3e64ac5e05c4d7198f259bdfdb50606f2"
    else
      url "https://github.com/heptau/pg_atropos/releases/download/v1.0.0/pg_atropos-1.0.0-linux-amd64.tar.gz"
      sha256 "5abee67b4309d3975a925e73610d28dceeadc13571c7da08c3ed872379365798"
    end
  end

  def install
    bin.install "pg_atropos"
  end

  test do
    assert_match "version", shell_output("#{bin}/pg_atropos --help")
  end
end
