cask "omnidb" do
  version "5.4.2"

  on_arm do
    sha256 "3729aee15f43e7c8295bce0f89ad1a77462152fbed80f25ef395a6f0f4f774a2"

    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-macOS-osx-arm64.zip"
  end
  on_intel do
    sha256 "ac5ac3bbbeed519a8eb6e7cb821577319dc34d0c4bdb5e0493d00a3c3fa6dbee"

    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-macOS-osx-x64.zip"
  end

  name "OmniDB"
  desc "Revived open-source database management tool (PostgreSQL-focused)"
  homepage "https://www.omnidb.net/"

  depends_on macos: :ventura

  app "OmniDB.app"

  postflight_steps do
    set_permissions "OmniDB.app", "755", base: :appdir

    run "/usr/bin/xattr",
        args: ["-r", "-d", "com.apple.quarantine", "{{appdir}}/OmniDB.app"]
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
