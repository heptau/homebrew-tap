cask "omnidb" do
  version "3.2.2"

  on_arm do
    sha256 "483afb197599588c6ad9bce49ebde2342bf3bf0a0aa441d858e80b94fc7c1902"
    url "https://github.com/heptau/omnidb/releases/download/v#{version}/OmniDB-#{version}-macOS-osx-arm64.zip"
  end

  name "OmniDB"
  desc "Revived open-source database management tool (PostgreSQL-focused, NW.js-based)"
  homepage "https://github.com/heptau/omnidb"

  depends_on macos: :ventura

  app "OmniDB.app"

  postflight do
    set_permissions "#{appdir}/OmniDB.app", '755'

    system_command "/usr/bin/xattr",
                   args:  ["-r", "-d", "com.apple.quarantine", "#{appdir}/OmniDB.app"],
                   sudo:  false
  end

  zap trash: [
    "~/Library/Application Support/OmniDB",
    "~/Library/Preferences/com.omnidb.*",
    "~/Library/Caches/OmniDB",
    "~/Library/Saved Application State/com.omnidb.savedState",
    "~/Library/Logs/OmniDB",
  ]

  caveats do
    <<~EOS
      OmniDB runs as a desktop application built with NW.js.
      It starts a local web server on first launch and opens its interface
      in the embedded browser window (usually at http://localhost:some-port).

      If the window does not open automatically, check the console output
      or try opening the reported address in your default browser.
    EOS
  end
end
