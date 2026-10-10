cask "pgarachne-app" do
  version "3.0.0"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "a7e615758eb345944fe15bd88a37dc798f48534ac677fb18bf07387911cfc28b"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "7e31a30b7a1c498b1baf5fef63ce4492716a5c93e86642382c98229e656628af"
  end

  app "PgArachne.app"
end
