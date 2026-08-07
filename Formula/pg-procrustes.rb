class PgProcrustes < Formula
  desc "Fast, flexible PostgreSQL SQL formatter"
  homepage "https://github.com/heptau/pg_procrustes"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.2.2/pg_procrustes-0.2.2-darwin-arm64.tar.gz"
      sha256 "78bcae562b86f55c2970e2ff52b56822c583edcd9bccca3544874221a4236669"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.2.2/pg_procrustes-0.2.2-linux-arm64.tar.gz"
      sha256 "91c057e2b65c9670f0d70a5e4f745527e0038204a935a1dc9a53205aca9748b3"
    end
    on_intel do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.2.2/pg_procrustes-0.2.2-linux-amd64.tar.gz"
      sha256 "6a31eccf31d549a5caa13a5e6ee68de18c055ad36960a851a3c3c1829fbc7cc7"
    end
  end

  def install
    bin.install "pg_procrustes"
  end

  test do
    system bin/"pg_procrustes", "--version"
  end
end
