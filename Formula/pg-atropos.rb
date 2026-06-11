class PgAtropos < Formula
  desc "PostgreSQL custom-format dump splitter for GIT"
  homepage "https://github.com/heptau/pg_atropos"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pg_atropos/releases/download/v1.1.0/pg_atropos-1.1.0-darwin-arm64.tar.gz"
      sha256 "f434e98495f65d7633eb43d62ca7b0dfc44b12d77d8edff8cb040e3d7373f0cd"
    else
      url "https://github.com/heptau/pg_atropos/releases/download/v1.1.0/pg_atropos-1.1.0-darwin-amd64.tar.gz"
      sha256 "a46d5e5b6085b89acb5f98841ecf45bb34f27f028d8f769cb7eba63f8f79a8af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heptau/pg_atropos/releases/download/v1.1.0/pg_atropos-1.1.0-linux-arm64.tar.gz"
      sha256 "e08dd5e63a7e466606860baa4aa469c7c671239676886b1866c1f3fde4496244"
    else
      url "https://github.com/heptau/pg_atropos/releases/download/v1.1.0/pg_atropos-1.1.0-linux-amd64.tar.gz"
      sha256 "be64cb8cb0faa3cc3495bfed459c7722f354a1a5b5c7b33bf684d78b7505aa6c"
    end
  end

  def install
    bin.install "pg_atropos"
  end

  test do
    assert_match "version", shell_output("#{bin}/pg_atropos --help")
  end
end
