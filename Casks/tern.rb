cask "tern" do
  version "0.1.6"
  sha256 "5fed1399bdcf9ee992d5efcf96c196a7a415fa604450e67f88c7fd9d59f0869d"

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
