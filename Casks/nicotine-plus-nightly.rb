cask "nicotine-plus-nightly" do
  version "20260317"

  on_arm do
    sha256 "b24522d6aa5ef7f6d5bf55c54f23165c1c8577598de52ff0bf757471691cd4cd"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260317/Nicotine+-3.4.0.dev1-arm64-20260317.dmg"
  end

  on_intel do
    sha256 "9a61d5f0da11d1824e6828553184971b20f2c7473a9bb58f8ff1753039d90f2f"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260317/Nicotine+-3.4.0.dev1-x86_64-20260317.dmg"
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
