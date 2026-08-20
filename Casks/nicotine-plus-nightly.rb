cask "nicotine-plus-nightly" do
  version "20260820"

  on_arm do
    sha256 "b4487f43b3acd1b95d487f5990874bc7290f389e4850635bdec5e423bcb1445c"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260820/Nicotine+-3.4.0.dev1-arm64-20260820.dmg"
  end

  on_intel do
    sha256 "378a3942cdce6afd8233c6f2b7251f8cfb14cdc62f5bea0611319b956b74103a"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260820/Nicotine+-3.4.0.dev1-x86_64-20260820.dmg"
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
