cask "pgarachne-app" do
  version "2.2.0"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "dfccb19f7c551447f3f3c22a9c99aed25607e34ffd116358cd96eeefcc5bdf65"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "2e3257e76034360f2c2540c548feb46a51b939257ccb660fd405664b49ae26d2"
  end

  app "PgArachne.app"
end
