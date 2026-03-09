cask "nicotine-plus-nightly" do
  version "20260309"

  on_arm do
    sha256 "b3b70d5cbde2338f7da53e5b7c5b2b94697400179c672d20f9d2d8480673eab1"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260309/Nicotine+-3.4.0.dev1-arm64-20260309.dmg"
  end

  on_intel do
    sha256 "731ca1b5e885040c99dbfdb1038fccba33ef866063ec82c9fd5df4eb4f580c98"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260309/Nicotine+-3.4.0.dev1-x86_64-20260309.dmg"
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
