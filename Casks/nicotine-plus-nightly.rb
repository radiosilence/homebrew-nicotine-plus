cask "nicotine-plus-nightly" do
  version "20260803"

  on_arm do
    sha256 "45eeeb2a0cf0728fd59b4db03b83a771c63c70ae6d0bb66756504fc769f1075a"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260803/Nicotine+-3.4.0.dev1-arm64-20260803.dmg"
  end

  on_intel do
    sha256 "53b836ccd901812dddf1334f6b0421f9b2098eff07157d36cef6554c94b371a6"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260803/Nicotine+-3.4.0.dev1-x86_64-20260803.dmg"
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
