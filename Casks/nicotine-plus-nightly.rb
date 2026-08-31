cask "nicotine-plus-nightly" do
  version "20260831"

  on_arm do
    sha256 "5915f390faf3be1bdcea0618dfa5b99e46c4adf5e4a575ee41e6766f8d4acf93"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260831/Nicotine+-3.4.0.dev1-arm64-20260831.dmg"
  end

  on_intel do
    sha256 "0c40c72d5740fc302b17857f2636331293e4ea745c02a8f29806e6781b3f0831"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260831/Nicotine+-3.4.0.dev1-x86_64-20260831.dmg"
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
