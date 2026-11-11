class PgProcrustes < Formula
  desc "Fast, flexible PostgreSQL SQL formatter"
  homepage "https://github.com/heptau/pg_procrustes"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.6.0/pg_procrustes-0.6.0-darwin-arm64.tar.gz"
      sha256 "44270cec624bb01eb64231e55ee0e204fa6bcd1028790f83d8ecc73336c31f5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.6.0/pg_procrustes-0.6.0-linux-arm64.tar.gz"
      sha256 "f8ce55b03fae73aff4ac3f803bbe272be1a7c7ad829921f9f23604d1ea04aaca"
    end
    on_intel do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.6.0/pg_procrustes-0.6.0-linux-amd64.tar.gz"
      sha256 "693753f5e7567d56970751518812e4fe3a4fdd92a77973b40e2cbfda50175264"
    end
  end

  def install
    bin.install "pg_procrustes"
    #  in a config is looked up in ../share/pg_procrustes/templates next to the binary
    (share/"pg_procrustes").install "templates"
  end

  test do
    system bin/"pg_procrustes", "--version"
    assert_match "postgresql", shell_output("#{bin}/pg_procrustes --list-templates")
  end
end
