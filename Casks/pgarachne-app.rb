cask "pgarachne-app" do
  version "2.0.1"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "90fdc549feaed3eaaf769caac8535a9c3a95499ddfce176ee1b04368190af2a4"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "329d3239ab3307c08fa4dde020d0f652d00cb1a8e5becdd919558ade26bd3b38"
  end

  app "PgArachne.app"
end
