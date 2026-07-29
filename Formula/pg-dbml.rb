class PgDbml < Formula
  desc "Pure SQL exporter from PostgreSQL to DBML"
  homepage "https://github.com/heptau/pg_dbml"
  url "https://github.com/heptau/pg_dbml/releases/download/v1.1.2/pg_dbml-1.1.2.tar.gz"
  sha256 "bc39a31ff8dabaebaed365dd36ff92e1a25146a5e8a5597917be09d7e8bfedc4"
  version "1.1.2"

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
