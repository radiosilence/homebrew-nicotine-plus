cask "nicotine-plus-nightly" do
  version "20260304"

  on_arm do
    sha256 "634bbe50f06a5cd62c116c88e0e0ec7880a7dc11968572e4dca0ccb67ce5ae5e"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260304/Nicotine+-3.4.0.dev1-arm64-20260304.dmg"
  end

  on_intel do
    sha256 "15d91ff25c3b1829eb17fc0ef8643751925be1e8e818d1d29f1f5fdc3f88d6d2"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260304/Nicotine+-3.4.0.dev1-x86_64-20260304.dmg"
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
