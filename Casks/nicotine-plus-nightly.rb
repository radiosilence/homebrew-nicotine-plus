cask "nicotine-plus-nightly" do
  version "20260311"

  on_arm do
    sha256 "6e627b287ee1af2ddef44146eeee1b231901559625887489abf4335a0f7daa36"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260311/Nicotine+-3.4.0.dev1-arm64-20260311.dmg"
  end

  on_intel do
    sha256 "cf16e899e93bb6701f6d2a4e1a37ef7c0b6a32a2bb1a6c2e34befef9f0216527"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260311/Nicotine+-3.4.0.dev1-x86_64-20260311.dmg"
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
