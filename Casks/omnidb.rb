cask "omnidb" do
  version "4.3.0"

  on_arm do
    sha256 "92311761e36ba339d6a53ac693fd67e791fea73d67c59b3d7840d35fe7b1047f"

    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-macOS-osx-arm64.zip"
  end
  on_intel do
    sha256 "77eb1cb5818b72ee67c5b98534f3198bbb78f82947273c8b8388906e73393495"

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
