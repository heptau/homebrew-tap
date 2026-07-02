cask "pgarachne-app" do
  version "2.0.2"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "b800d2293d3eca7a28b04f7ca72925a768949bc991665026c5b0004f7fb156e6"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "d573e565b814058236e1b05a33593241a8d4e30c6039bc9f31a03cbcceb2bf4a"
  end

  app "PgArachne.app"
end
