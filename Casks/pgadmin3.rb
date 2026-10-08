cask "pgadmin3" do
  version "2026.10.08"
  name "pgAdmin III"
  desc "Native PostgreSQL administration GUI (community fork of pgAdmin III)"
  homepage "https://github.com/heptau/pgadmin3"

  depends_on arch: :arm64
  depends_on macos: :monterey

  url "https://github.com/heptau/pgadmin3/releases/download/v#{version}/pgAdmin3-#{version}-macos-arm64.zip"
  sha256 "6fe96fa3f9e1521cb9601fc59d78e3bda7b23f3b7749626f8fda488e84d460f6"

  app "pgAdmin III.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-r", "-d", "com.apple.quarantine", "{{appdir}}/pgAdmin III.app"]
  end

  zap trash: [
    "~/Library/Preferences/postgresql",
  ]
end
