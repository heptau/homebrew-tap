cask "omnidb" do
  version "4.0.0"

  on_arm do
    sha256 "e0ee6b25d0f5fd41c5176609717305b6b42f41440cf9d89c956601d70d33a981"
    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-#{version}-macOS-osx-arm64.zip"
  end

  on_intel do
    sha256 "b603737e2015bfd8671da7b3f7bfc484ed69ed55b44cfa6aedc2a82a5df7520c"
    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-#{version}-macOS-osx-x64.zip"
  end

  name "OmniDB"
  desc "Revived open-source database management tool (PostgreSQL-focused)"
  homepage "https://github.com/heptau/omnidb"

  depends_on macos: :ventura

  app "OmniDB.app"

  postflight do
    set_permissions "#{appdir}/OmniDB.app", '755'

    system_command "/usr/bin/xattr",
                   args:  ["-r", "-d", "com.apple.quarantine", "#{appdir}/OmniDB.app"],
                   sudo:  false
  end

  # Bundle ID is "net.omnidb" (wails-app/build/darwin/Info.plist,
  # AGENTS.md) — these paths used to say "com.omnidb.*", which never
  # matched anything real, so `brew uninstall --zap` silently left the
  # actual prefs/saved-state files behind.
  zap trash: [
    "~/Library/Application Support/OmniDB",
    "~/Library/Preferences/net.omnidb.plist",
    "~/Library/Caches/OmniDB",
    "~/Library/Saved Application State/net.omnidb.savedState",
    "~/Library/Logs/OmniDB",
  ]

  caveats do
    <<~EOS
      OmniDB starts a local web server on first launch and opens its
      interface in the app window (usually at http://localhost:some-port).

      If the window does not open automatically, check the console output
      or try opening the reported address in your default browser.
    EOS
  end
end
