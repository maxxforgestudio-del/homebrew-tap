cask "aries-dynamic-island" do
  version "2.0.0"
  sha256 "35324dde2168190c56075b79c2d117d90eb6115d01474ec2e0171d902f778e13"

  url "https://github.com/maxxforgestudio-del/aries-dynamic-island/releases/download/v#{version}/Aries-Dynamic-Island-#{version}.zip"
  name "Aries Dynamic Island"
  desc "Dynamic Island for the Mac notch: music, lyrics, widgets, calls and tools"
  homepage "https://maxxforgestudio-del.github.io/aries-dynamic-island/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Aries Dynamic Island.app"

  postflight do
    # The app is ad-hoc signed (not notarized), so clear the download quarantine flag.
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Aries Dynamic Island.app"]
  end

  zap trash: [
    "~/Library/Application Support/Aries Dynamic Island",
    "~/Library/Preferences/app.aries.dynamicisland.plist",
  ]
end
