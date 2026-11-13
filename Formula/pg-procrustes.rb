class PgProcrustes < Formula
  desc "Fast, flexible PostgreSQL SQL formatter"
  homepage "https://github.com/heptau/pg_procrustes"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.6.1/pg_procrustes-0.6.1-darwin-arm64.tar.gz"
      sha256 "4503102605084707c159bedfb179cab3d6144dd3f03262a17a283ada771150ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.6.1/pg_procrustes-0.6.1-linux-arm64.tar.gz"
      sha256 "eb940c62992798d5ca5f1aea90abf3830422d0f7c3a373846256d8aefdef05d1"
    end
    on_intel do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.6.1/pg_procrustes-0.6.1-linux-amd64.tar.gz"
      sha256 "3eeaeaecc6f27badd45a74b0286ebfba0f634b01b968db7a6f1983ba21d7ad47"
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
