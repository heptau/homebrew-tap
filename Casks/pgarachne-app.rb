cask "pgarachne-app" do
  version "2.0.0"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "537e5ed2b6b378a87d060a551bc41e897092419a19af710ddd05388ffc83ca03"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "1d72c6994129a55ae2ebf060ac466b286b09b740f3970ad7b521cddea704025b"
  end

  app "PgArachne.app"
end
