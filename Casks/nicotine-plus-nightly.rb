cask "nicotine-plus-nightly" do
  version "20260712"

  on_arm do
    sha256 "aad8004b3341b6915216c56eae7da9587872fec1d7e12e12af903fa6cdcd2260"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260712/Nicotine+-3.4.0.dev1-arm64-20260712.dmg"
  end

  on_intel do
    sha256 "ef40ccb75dbfa7ad712211832a1a009d1c15460595c04ee422a81f72241f7e71"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260712/Nicotine+-3.4.0.dev1-x86_64-20260712.dmg"
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
