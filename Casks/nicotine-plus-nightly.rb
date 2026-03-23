cask "nicotine-plus-nightly" do
  version "20260323"

  on_arm do
    sha256 "82e04497f0399a60c9a46a9b82c39c203f456661f17f060133a5ddff4a7dbfbe"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260323/Nicotine+-3.4.0.dev1-arm64-20260323.dmg"
  end

  on_intel do
    sha256 "8d56a6b6bf086b19336449e690581f44c8ab0f06be9f5a8784ce079cc6e18bc6"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260323/Nicotine+-3.4.0.dev1-x86_64-20260323.dmg"
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
