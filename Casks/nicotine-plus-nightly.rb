cask "nicotine-plus-nightly" do
  version "20260819"

  on_arm do
    sha256 "af83cefbe1ab32ce2a2b65e6ee88c56338ecceda7c18fe315ccab85891303bfe"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260819/Nicotine+-3.4.0.dev1-arm64-20260819.dmg"
  end

  on_intel do
    sha256 "ab829633ab6838466e09197b533b6ceaf43a8c987aea072448bc4ac4dfd70b8a"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260819/Nicotine+-3.4.0.dev1-x86_64-20260819.dmg"
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
