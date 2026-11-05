class PgProcrustes < Formula
  desc "Fast, flexible PostgreSQL SQL formatter"
  homepage "https://github.com/heptau/pg_procrustes"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.3.0/pg_procrustes-0.3.0-darwin-arm64.tar.gz"
      sha256 "a40e69f0c9769130d1535e52e8bc2935391066174b105bc1187b8a668c7a1d0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.3.0/pg_procrustes-0.3.0-linux-arm64.tar.gz"
      sha256 "1c086f60e7f2f14658acea6b8cf737a52c7216e4decc61f4768753a86d67d349"
    end
    on_intel do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.3.0/pg_procrustes-0.3.0-linux-amd64.tar.gz"
      sha256 "50938c155278a47d2d80475f1c6094845279ed0cdb8a2dbae099f3528fe65d18"
    end
  end

  def install
    bin.install "pg_procrustes"
  end

  test do
    system bin/"pg_procrustes", "--version"
  end
end
