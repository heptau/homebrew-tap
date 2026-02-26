cask "pgarachne-app" do
  version "1.1.0"
  name "PgArachne"
  desc "GUI wrapper for PgArachne"
  homepage "https://www.pgarachne.com/"

  on_arm do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-arm64-app.zip"
    sha256 "2808a85745dbab737a55dff91dfecf088e2623040873f3650aa11325ff901563"
  end

  on_intel do
    url "https://github.com/heptau/pgarachne/releases/download/v#{version}/pgarachne-macos-amd64-app.zip"
    sha256 "e23ebe7e94df0edd022a57474f8f677d33660a5a95b72701257b1e61d31427a1"
  end

  app "PgArachne.app"
end
