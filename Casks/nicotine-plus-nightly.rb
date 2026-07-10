cask "nicotine-plus-nightly" do
  version "20260710"

  on_arm do
    sha256 "04e298e220e5be1937802363b35b4637af73f0a26666416a0ef36afb4cc84bc7"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260710/Nicotine+-3.4.0.dev1-arm64-20260710.dmg"
  end

  on_intel do
    sha256 "14328f1862e7e1c68ce6b9f3aaf2ebe107d50373cfdd24990e98e0a9c56d751a"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260710/Nicotine+-3.4.0.dev1-x86_64-20260710.dmg"
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
