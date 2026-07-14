cask "nicotine-plus-nightly" do
  version "20260714"

  on_arm do
    sha256 "96417e148677d7a01f7ce36e4809f9dfc60a3b0702563100b7288f159a97b50e"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260714/Nicotine+-3.4.0.dev1-arm64-20260714.dmg"
  end

  on_intel do
    sha256 "370f3fe291b80eb8133c01fd1eed658ec6dac16919ce94798041556ebc8ed957"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260714/Nicotine+-3.4.0.dev1-x86_64-20260714.dmg"
  end

  name "Nicotine+"
  desc "Graphical client for the Soulseek peer-to-peer network (nightly build)"
  homepage "https://github.com/radiosilence/nicotine-plus"

  depends_on macos: :sonoma

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
