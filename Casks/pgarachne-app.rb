cask "pgarachne-app" do
  version "3.0.1"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "a7d81d283d5846aa206ade0ed70cec6d01b45ff0ccb998646bb06dda70323deb"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "74378bd2754866b04d863c27578f46ae500af3b1820ec8ed2a4fe3eb53840d70"
  end

  app "PgArachne.app"
end
