class PgDbml < Formula
  desc "Pure SQL exporter from PostgreSQL to DBML"
  homepage "https://github.com/heptau/pg_dbml"
  url "https://github.com/heptau/pg_dbml/releases/download/v1.1.3/pg_dbml-1.1.3.tar.gz"
  sha256 "2085675e4563d23abfd86872ea315b98c5e846df6d5ddf50577f70ddfb1edc05"
  version "1.1.3"

  depends_on "libpq"

  def install
    libexec.install "pg_dbml", "pg_dbml.sql"

    (bin/"pg_dbml").write <<~EOS
      #!/bin/bash
      export PG_DBML_SQL_PATH="#{libexec}/pg_dbml.sql"
      exec "#{libexec}/pg_dbml" "$@"
    EOS

    chmod "+x", bin/"pg_dbml"
  end

  test do
    system "#{bin}/pg_dbml", "--version"
  end
end
