cask "pgarachne-app" do
  version "1.3.0"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "10b0dc7a72c1883088af2bbe1231c8b6a406e449845b4cf271ff355bb227c0d9"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "f23bd24c6f1752c83634db797b2d1135ff12fcaa71061b6ea188f346e83feef9"
  end

  app "PgArachne.app"
end
