cask "nicotine-plus-nightly" do
  version "20260305"

  on_arm do
    sha256 "2c7f75538c462e79dbc2f3eb4ce0c591adafd08808e6ee62a9c211d964c45d45"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260305/Nicotine+-3.4.0.dev1-arm64-20260305.dmg"
  end

  on_intel do
    sha256 "82be47d0791d0dad0b45b0daac12dcc98347133d5b1cc20329a3ba648904743d"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260305/Nicotine+-3.4.0.dev1-x86_64-20260305.dmg"
  end

  name "Nicotine+"
  desc "Graphical client for the Soulseek peer-to-peer network (nightly build)"
  homepage "https://github.com/radiosilence/nicotine-plus"

  depends_on macos: ">= :ventura"

  app "Nicotine+.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Nicotine+.app"]
  end

  zap trash: [
    "~/.config/nicotine",
    "~/.local/share/nicotine",
  ]
end
