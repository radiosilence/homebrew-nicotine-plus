cask "nicotine-plus-nightly" do
  version "20260513"

  on_arm do
    sha256 "59b308a541a5d2b8d1c21773d61b098d4472cb1a7cf4067d747037307a62f23b"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260513/Nicotine+-3.4.0.dev1-arm64-20260513.dmg"
  end

  on_intel do
    sha256 "28b6692dc1b4363d755f4da89d42ef97ad6c0c8b6c998b3c62d7f2b14064a376"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260513/Nicotine+-3.4.0.dev1-x86_64-20260513.dmg"
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
