cask "pgadmin3" do
  version "2026.07.21"
  name "pgAdmin III"
  desc "Native PostgreSQL administration GUI (community fork of pgAdmin III)"
  homepage "https://github.com/heptau/pgadmin3"

  depends_on arch: :arm64
  depends_on macos: :monterey

  url "https://github.com/heptau/pgadmin3/releases/download/v#{version}/pgAdmin3-#{version}-macos-arm64.zip"
  sha256 "a1827338f06beb94e38933270e90d95e7e2d08da48198d0f8a5fcdce8ae7a590"

  app "pgAdmin III.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/pgAdmin III.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Preferences/postgresql",
  ]
end
