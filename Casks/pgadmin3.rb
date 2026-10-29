cask "pgadmin3" do
  version "2026.10.29"
  name "pgAdmin III"
  desc "Native PostgreSQL administration GUI (community fork of pgAdmin III)"
  homepage "https://github.com/heptau/pgadmin3"

  depends_on arch: :arm64
  depends_on macos: :monterey

  url "https://github.com/heptau/pgadmin3/releases/download/v#{version}/pgAdmin3-#{version}-macos-arm64.zip"
  sha256 "e8bb2e67ef50fc90c551d389beaafc191f28761dde0e294d758b725d8e2806b8"

  app "pgAdmin III.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-r", "-d", "com.apple.quarantine", "{{appdir}}/pgAdmin III.app"]
  end

  zap trash: [
    "~/Library/Preferences/postgresql",
  ]
end
