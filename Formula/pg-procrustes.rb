class PgProcrustes < Formula
  desc "Fast, flexible PostgreSQL SQL formatter"
  homepage "https://github.com/heptau/pg_procrustes"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.2.0/pg_procrustes-0.2.0-darwin-arm64.tar.gz"
      sha256 "9c6636c0b70e8a4f452e7507b4d53e12ac9c7415fa1c9663913af4e004745cd9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.2.0/pg_procrustes-0.2.0-linux-arm64.tar.gz"
      sha256 "93aaaf08104f8121d25bf1016f09f9e8719858619174aa46acbf74559d6c08ad"
    end
    on_intel do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.2.0/pg_procrustes-0.2.0-linux-amd64.tar.gz"
      sha256 "e67621214f7d23321464a3fc4fbd9c0b7554f1e5d6bd4640b0e7075cd85ebfe2"
    end
  end

  def install
    bin.install "pg_procrustes"
  end

  test do
    system bin/"pg_procrustes", "--version"
  end
end
