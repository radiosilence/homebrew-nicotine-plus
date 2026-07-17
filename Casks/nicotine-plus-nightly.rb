cask "nicotine-plus-nightly" do
  version "20260717"

  on_arm do
    sha256 "e96022a240b315a067192a5f1d9c6165285134a79a9fd71461aabf0c85aaa36b"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260717/Nicotine+-3.4.0.dev1-arm64-20260717.dmg"
  end

  on_intel do
    sha256 "1bea83dac76cc86511decbea8e8714f33b63fbbe122d8e449bb129984486ec95"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260717/Nicotine+-3.4.0.dev1-x86_64-20260717.dmg"
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
