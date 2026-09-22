cask "pgadmin3" do
  version "2026.09.22"
  name "pgAdmin III"
  desc "Native PostgreSQL administration GUI (community fork of pgAdmin III)"
  homepage "https://github.com/heptau/pgadmin3"

  depends_on arch: :arm64
  depends_on macos: :monterey

  url "https://github.com/heptau/pgadmin3/releases/download/v#{version}/pgAdmin3-#{version}-macos-arm64.zip"
  sha256 "c42bd9e5c330e71e1d1eef999a370957bd65e4e5284c3e755a8387f1def1cf45"

  app "pgAdmin III.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-r", "-d", "com.apple.quarantine", "{{appdir}}/pgAdmin III.app"]
  end

  zap trash: [
    "~/Library/Preferences/postgresql",
  ]
end
