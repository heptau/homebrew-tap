cask "pgadmin3" do
  version "2026.07.14"
  name "pgAdmin III"
  desc "Native PostgreSQL administration GUI (community fork of pgAdmin III)"
  homepage "https://github.com/heptau/pgadmin3"

  depends_on arch: :arm64
  depends_on macos: :monterey

  url "https://github.com/heptau/pgadmin3/releases/download/v#{version}/pgAdmin3-#{version}-macos-arm64.zip"
  sha256 "0bd117f7b8b858f192d270357ee269444a17cc30860a19ec3f2c9de7a46efb25"

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
