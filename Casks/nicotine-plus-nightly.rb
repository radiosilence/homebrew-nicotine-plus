cask "nicotine-plus-nightly" do
  version "20260306"

  on_arm do
    sha256 "0cc16834b8d636c04616502b8156128ac8a968852c17af8db323ab92c5176748"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260306/Nicotine+-3.4.0.dev1-arm64-20260306.dmg"
  end

  on_intel do
    sha256 "7215ab3cd020ad86da73e9e76985d914d93aedc29df9b6514b9e73c392d3d0e5"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260306/Nicotine+-3.4.0.dev1-x86_64-20260306.dmg"
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
