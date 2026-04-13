cask "nicotine-plus-nightly" do
  version "20260413"

  on_arm do
    sha256 "fbc17be4c5d6c067f712b0d70e0ccdb78a4a6ff2afbca4c8328d22a99e5f128c"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260413/Nicotine+-3.4.0.dev1-arm64-20260413.dmg"
  end

  on_intel do
    sha256 "d9e10aaa380ce927da0e7a14b71218962faec3fec232965cccd8b0abe6801c44"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260413/Nicotine+-3.4.0.dev1-x86_64-20260413.dmg"
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
