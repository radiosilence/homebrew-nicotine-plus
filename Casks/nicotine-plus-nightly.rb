cask "nicotine-plus-nightly" do
  version "20260702"

  on_arm do
    sha256 "f39df093cc781e48fa90a76559b990d4fc244a19314f64416e0ec5a492ec7e3b"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260702/Nicotine+-3.4.0.dev1-arm64-20260702.dmg"
  end

  on_intel do
    sha256 "2c8a45ed0bfb4d55f2b7e31d82521125f565404a87911167682c4fdb2cad563e"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260702/Nicotine+-3.4.0.dev1-x86_64-20260702.dmg"
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
