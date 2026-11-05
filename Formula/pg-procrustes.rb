class PgProcrustes < Formula
  desc "Fast, flexible PostgreSQL SQL formatter"
  homepage "https://github.com/heptau/pg_procrustes"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.4.0/pg_procrustes-0.4.0-darwin-arm64.tar.gz"
      sha256 "bcdfb67e4001e106d738515eca57f0c403b1da932ddb1f2f247bc8795581eb62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.4.0/pg_procrustes-0.4.0-linux-arm64.tar.gz"
      sha256 "4bf054f30932a4e0929bc8320c2a6f704376c447e738bb85b4038bd89ba2b3f7"
    end
    on_intel do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.4.0/pg_procrustes-0.4.0-linux-amd64.tar.gz"
      sha256 "9f3716306e1a1ff86ccd69e0fe2b8ae2069cb7084e807ff4fef0bf8e598b98fe"
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
