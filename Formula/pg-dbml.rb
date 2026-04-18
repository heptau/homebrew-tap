class PgDbml < Formula
  desc "Pure SQL exporter from PostgreSQL to DBML"
  homepage "https://github.com/heptau/pg_dbml"
  url "https://github.com/heptau/pg_dbml/releases/download/v1.0.0/pg_dbml-1.0.0.tar.gz"
  sha256 "c882aa8936ae630b2ca7c9cf39b207d3746f8b722969bbea09ca349e4d3b5d43"
  version "1.0.0"

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
