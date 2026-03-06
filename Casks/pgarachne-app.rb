cask "pgarachne-app" do
  version "1.2.0"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "f68fd4417441d0de87ef26488222d890b5d6002feca9858fe4702a23ed25c780"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "f6bc48a4c0907dab621c3ee72d8b92b0d1f9dd4d2de049ed207f6c8459ab5873"
  end

  app "PgArachne.app"

  postflight do
    app_path = "#{appdir}/PgArachne.app"

    if File.exist?(app_path)
      system_command "/usr/bin/xattr",
                     args:  ["-r", "-d", "com.apple.quarantine", app_path],
                     print_stderr: false
    end
  end

  zap trash: [
    "~/Library/Application Support/PgArachne",
    "~/Library/Preferences/com.pgarachne.*",
    "~/Library/Caches/PgArachne",
    "~/Library/Saved Application State/com.pgarachne.savedState",
    "~/Library/Logs/PgArachne",
  ]
end
