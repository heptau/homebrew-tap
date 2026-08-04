cask "pgarachne-app" do
  version "2.0.3"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "ac10e9961b99362b0b87a9e2085347c928d58152bb707fd12198e8efcf3d9f5f"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "02b420e86b2a4feebdf6647f571a131ccad15c030862bb104522577a51d4e44d"
  end

  app "PgArachne.app"
end
