cask "pgadmin3" do
  version "2026.07.13"
  name "pgAdmin III"
  desc "Native PostgreSQL administration GUI (community fork of pgAdmin III)"
  homepage "https://github.com/heptau/pgadmin3"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  url "https://github.com/heptau/pgadmin3/releases/download/v#{version}/pgAdmin3-#{version}-macos-arm64.zip"
  sha256 "c0f6fa4c19931cd269d5f746431cb221e4791bc5f9ada00cf92404ae9cda2660"

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
