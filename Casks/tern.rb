cask "tern" do
  version "0.1.5"
  sha256 "d9e49cf576d952f0f9288991c13907b6598987e93a7abca07cbfb6faffe2166e"

  url "https://github.com/dominik-bura/tern/releases/download/v#{version}/Tern-#{version}.dmg"
  name "Tern"
  desc "Opens each link in the right browser and profile"
  homepage "https://github.com/dominik-bura/tern"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Tern.app"

  caveats <<~EOS
    Tern isn't notarized by Apple. On first launch, approve it in
    System Settings → Privacy & Security, or run:
      xattr -dr com.apple.quarantine #{appdir}/Tern.app
  EOS

  uninstall quit: "com.dominikbura.tern"

  zap trash: [
    "~/Library/Application Support/com.dominikbura.tern",
    "~/Library/Preferences/com.dominikbura.tern.plist",
  ]
end
