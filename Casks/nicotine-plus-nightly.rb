cask "nicotine-plus-nightly" do
  version "20260619"

  on_arm do
    sha256 "e4253824215dfd741a1a643a911fa770daf265ab00af3a923c344d5d89b573b5"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260619/Nicotine+-3.4.0.dev1-arm64-20260619.dmg"
  end

  on_intel do
    sha256 "eed4af001ff23ce122be499b43307437b6b0705f486644bb283e5a98ce55b444"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260619/Nicotine+-3.4.0.dev1-x86_64-20260619.dmg"
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
