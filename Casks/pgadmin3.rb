cask "pgadmin3" do
  version "2026.11.04"
  name "pgAdmin III"
  desc "Native PostgreSQL administration GUI (community fork of pgAdmin III)"
  homepage "https://github.com/heptau/pgadmin3"

  depends_on arch: :arm64
  depends_on macos: :monterey

  url "https://github.com/heptau/pgadmin3/releases/download/v#{version}/pgAdmin3-#{version}-macos-arm64.zip"
  sha256 "82de0bfb99be56e927ecd45231e04d817683ec909141a70d043c169f2d36704f"

  app "pgAdmin III.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-r", "-d", "com.apple.quarantine", "{{appdir}}/pgAdmin III.app"]
  end

  zap trash: [
    "~/Library/Preferences/postgresql",
  ]
end
