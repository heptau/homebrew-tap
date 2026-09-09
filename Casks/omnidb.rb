cask "omnidb" do
  version "4.4.2"

  on_arm do
    sha256 "455ae6c03d9679f61aad60c7f37e0f15b856667cab7e07593f181ba816f09e4e"

    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-macOS-osx-arm64.zip"
  end
  on_intel do
    sha256 "dd4a088a106b0ed69ddc688f2e13982f3c10d555b5aba26a6ca2cf45890625c8"

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
