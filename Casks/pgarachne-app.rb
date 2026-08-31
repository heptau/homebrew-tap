cask "pgarachne-app" do
  version "2.1.0"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "c4fe96f94650fac124729fc243b8db4f353784317eac4b348e3f649fbb331708"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "f6ae5e2e32d50f757b19f4aa949bae14921b46988296c8203ed13f1825021141"
  end

  app "PgArachne.app"
end
