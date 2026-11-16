cask "aries-dynamic-island" do
  version "2.0.1"
  sha256 "d82150ecdc9555588218b3969903e048f76253f195bdc878b70d2bf9e9cb8f23"

  url "https://github.com/maxxforgestudio-del/aries-dynamic-island/releases/download/v#{version}/Aries-Dynamic-Island-#{version}.zip"
  name "Aries Dynamic Island"
  desc "Dynamic Island for the notch: music, lyrics, widgets, calls and tools"
  homepage "https://maxxforgestudio-del.github.io/aries-dynamic-island/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Aries Dynamic Island.app"

  zap trash: [
    "~/Library/Application Support/Aries Dynamic Island",
    "~/Library/Preferences/app.aries.dynamicisland.plist",
  ]

  caveats <<~EOS
    Aries isn't from the App Store. The first time, right-click it in
    Applications and choose Open, then Open again.
  EOS
end
