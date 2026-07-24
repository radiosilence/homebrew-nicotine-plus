cask "nicotine-plus-nightly" do
  version "20260724"

  on_arm do
    sha256 "bc5d8f912b5677e6719da94cf123802ba520389459a1c2c0e2eed4fc66e3ad32"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260724/Nicotine+-3.4.0.dev1-arm64-20260724.dmg"
  end

  on_intel do
    sha256 "81f68722a1e55562ad3889adb7082d3ce1fc7afb2f301d80ed048669ad047dbc"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260724/Nicotine+-3.4.0.dev1-x86_64-20260724.dmg"
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
