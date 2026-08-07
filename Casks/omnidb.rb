cask "omnidb" do
  version "4.2.0"

  on_arm do
    sha256 "dcaf8cefd351130cae5762c873b07065afd59d5e5f355fe4e9ca3a5ff078ba66"

    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-#{version}-macOS-osx-arm64.zip"
  end
  on_intel do
    sha256 "2a6f5b26c370d0d634ec2bbbac521e1e653d35c5eae63307d681184cc2375563"

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
