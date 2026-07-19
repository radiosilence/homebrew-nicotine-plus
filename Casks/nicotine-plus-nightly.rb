cask "nicotine-plus-nightly" do
  version "20260719"

  on_arm do
    sha256 "95b3c44218e2acc802a32746b0ebdabcf848a86d098c445c1cb02229f3008ade"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260719/Nicotine+-3.4.0.dev1-arm64-20260719.dmg"
  end

  on_intel do
    sha256 "d339b2fe7bb7a227e8f73ee070a21020537fb9b773036cb3aceba5124d1df3cc"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260719/Nicotine+-3.4.0.dev1-x86_64-20260719.dmg"
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
