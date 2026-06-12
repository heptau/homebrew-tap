class PgDbml < Formula
  desc "Pure SQL exporter from PostgreSQL to DBML"
  homepage "https://github.com/heptau/pg_dbml"
  url "https://github.com/heptau/pg_dbml/releases/download/v1.1.0/pg_dbml-1.1.0.tar.gz"
  sha256 "6b220e40fd038c9f557897637f9ae6c05f4d4250fab9b0819068396a4976d8f1"
  version "1.1.0"

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
