class PgProcrustes < Formula
  desc "Fast, flexible PostgreSQL SQL formatter"
  homepage "https://github.com/heptau/pg_procrustes"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.5.0/pg_procrustes-0.5.0-darwin-arm64.tar.gz"
      sha256 "d0323164ffa6c372949410e506b7fd9176c3b4c8c4ad4c6713321633041a42c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.5.0/pg_procrustes-0.5.0-linux-arm64.tar.gz"
      sha256 "1cd63189e7213a63725469a11b9c91a30a3a4582d77d87b23b8caddff691a333"
    end
    on_intel do
      url "https://github.com/heptau/pg_procrustes/releases/download/v0.5.0/pg_procrustes-0.5.0-linux-amd64.tar.gz"
      sha256 "29c3073d6027c88615a24f3aada76c519f4717ffd1cb44b7162dd9c405171f78"
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
