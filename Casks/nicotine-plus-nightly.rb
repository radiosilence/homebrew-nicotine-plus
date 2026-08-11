cask "nicotine-plus-nightly" do
  version "20260811"

  on_arm do
    sha256 "b8b15bd789cb2edb9a206141c2c3d84883deaf735eda4c1da4ad2b6af78cb1b6"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260811/Nicotine+-3.4.0.dev1-arm64-20260811.dmg"
  end

  on_intel do
    sha256 "33d9ef0fe005382373889672cf2b9ce298f397681ab5230246a0d057e941dacd"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260811/Nicotine+-3.4.0.dev1-x86_64-20260811.dmg"
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
