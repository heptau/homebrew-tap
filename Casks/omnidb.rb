cask "omnidb" do
  version "4.1.0"

  on_arm do
    sha256 "60267905ba8de03eefd8791fdfa8a4f6be22a66cff74447569038e7e1a2f3042"

    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-#{version}-macOS-osx-arm64.zip"
  end
  on_intel do
    sha256 "531112364266a09909add82640728b5d61cb32ef67ce3cfaed5ba29b1601f691"

    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-#{version}-macOS-osx-x64.zip"
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
