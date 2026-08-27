cask "nicotine-plus-nightly" do
  version "20260827"

  on_arm do
    sha256 "a46195116e563925ca61a844d855576bc9dc541c736473656bd54d03690e6763"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260827/Nicotine+-3.4.0.dev1-arm64-20260827.dmg"
  end

  on_intel do
    sha256 "7823c3e0217abf9a84506639e413e25a890dca3e2c61ad37823179099a340411"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260827/Nicotine+-3.4.0.dev1-x86_64-20260827.dmg"
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
