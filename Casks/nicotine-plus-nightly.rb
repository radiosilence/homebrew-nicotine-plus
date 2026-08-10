cask "nicotine-plus-nightly" do
  version "20260810"

  on_arm do
    sha256 "1056d5f490128521615a47e72b8dcd1eca2c38f23f3c1574e152f5b147950909"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260810/Nicotine+-3.4.0.dev1-arm64-20260810.dmg"
  end

  on_intel do
    sha256 "0190e7b5a6cbfd1332a74f59cd77b286a499248123445511ad8aa872c8e08035"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260810/Nicotine+-3.4.0.dev1-x86_64-20260810.dmg"
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
