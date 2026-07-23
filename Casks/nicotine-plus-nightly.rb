cask "nicotine-plus-nightly" do
  version "20260723"

  on_arm do
    sha256 "3e751762a6f769af3a19bf4e06f822b261bdc593f5a1549abda155c7c49c91af"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260723/Nicotine+-3.4.0.dev1-arm64-20260723.dmg"
  end

  on_intel do
    sha256 "d5f6c4f554766d684b359fa896d60ae919c925ae21f9f409e48136b3086cdd03"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260723/Nicotine+-3.4.0.dev1-x86_64-20260723.dmg"
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
