cask "pgadmin3" do
  version "2026.08.07"
  name "pgAdmin III"
  desc "Native PostgreSQL administration GUI (community fork of pgAdmin III)"
  homepage "https://github.com/heptau/pgadmin3"

  depends_on arch: :arm64
  depends_on macos: :monterey

  url "https://github.com/heptau/pgadmin3/releases/download/v#{version}/pgAdmin3-#{version}-macos-arm64.zip"
  sha256 "14df39b328f6c2d75a549ee505463159c556e1e0922fa6c27659cd3e6bc9c6ab"

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
