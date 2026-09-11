cask "omnidb" do
  version "4.4.3"

  on_arm do
    sha256 "fc0fc1eeb00079e95ba48fe2efb2a6f2fe1d307dabf23f4fc6fa4b93d6a54338"

    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-macOS-osx-arm64.zip"
  end
  on_intel do
    sha256 "2689d37d744f5baa3ab0428514111e7eb0e529993590c60847b080d7f99ae7b7"

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
