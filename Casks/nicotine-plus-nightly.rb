cask "nicotine-plus-nightly" do
  version "20260830"

  on_arm do
    sha256 "a47b232231b0ea4648dca6e7e66d070b7212c6a5652224919600a6458cbc2f62"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260830/Nicotine+-3.4.0.dev1-arm64-20260830.dmg"
  end

  on_intel do
    sha256 "ce1b04c1fa1638c61e6ef3b262f2deb03bb5ccf3c07b39e9b3df758dbbacd065"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260830/Nicotine+-3.4.0.dev1-x86_64-20260830.dmg"
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
