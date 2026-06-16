cask "nicotine-plus-nightly" do
  version "20260616"

  on_arm do
    sha256 "de9f7df70b5df0d5daf09b8f409c518e1e3a2c35d22f36974875fcbde656d0b6"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260616/Nicotine+-3.4.0.dev1-arm64-20260616.dmg"
  end

  on_intel do
    sha256 "5fb7546dfc3a66fe7d2d77c0690a0cb4e47d18cb7f7026c8fca8cd4cb05e9ac1"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260616/Nicotine+-3.4.0.dev1-x86_64-20260616.dmg"
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
