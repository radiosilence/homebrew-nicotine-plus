cask "nicotine-plus-nightly" do
  version "20260308"

  on_arm do
    sha256 "ab08f430de29be0823ff91d881a01364ed1ac04b90c6e03160bacef4bc84ab1b"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260308/Nicotine+-3.4.0.dev1-arm64-20260308.dmg"
  end

  on_intel do
    sha256 "406d82c068802fb81070cba047d20a462cedaa29ad610ad7236a05cf5b9d06aa"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260308/Nicotine+-3.4.0.dev1-x86_64-20260308.dmg"
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
