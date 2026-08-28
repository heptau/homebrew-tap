cask "omnidb" do
  version "4.2.2"

  on_arm do
    sha256 "a41582c1c3cfcd0f584c7a0b8d4d4b9b2438769154e3670a4a919edc48abd3c5"

    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-macOS-osx-arm64.zip"
  end
  on_intel do
    sha256 "27475d8ddf67f1b5853024d75ef53959d1a5497dee069695c90c11f65f956307"

    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-macOS-osx-x64.zip"
  end

  name "OmniDB"
  desc "Revived open-source database management tool (PostgreSQL-focused)"
  homepage "https://www.omnidb.net/"

  depends_on macos: :ventura

  app "OmniDB.app"

  postflight do
    set_permissions "#{appdir}/OmniDB.app", "755"

    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/OmniDB.app"],
                   sudo: false
  end

  uninstall quit: "net.omnidb"

  # Bundle ID is "net.omnidb" (wails-app/build/darwin/Info.plist,
  # AGENTS.md) — these paths used to say "com.omnidb.*", which never
  # matched anything real, so `brew uninstall --zap` silently left the
  # actual prefs/saved-state files behind.
  zap trash: [
    "~/Library/Application Support/OmniDB",
    "~/Library/Caches/OmniDB",
    "~/Library/Logs/OmniDB",
    "~/Library/Preferences/net.omnidb.plist",
    "~/Library/Saved Application State/net.omnidb.savedState",
  ]

  caveats do
    <<~EOS
      OmniDB is a lightweight, native desktop client for managing
      PostgreSQL databases.
    EOS
  end
end
