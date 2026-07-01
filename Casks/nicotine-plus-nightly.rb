cask "nicotine-plus-nightly" do
  version "20260701"

  on_arm do
    sha256 "1e88d8c35c984ca55e875a0eaf4f45c2a96ece56446c736d63a268f8ebcd1af2"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260701/Nicotine+-3.4.0.dev1-arm64-20260701.dmg"
  end

  on_intel do
    sha256 "852db1aebf37286b914be9d6a7cfbb153dc17bb2d657deffef13d827ce15b79f"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260701/Nicotine+-3.4.0.dev1-x86_64-20260701.dmg"
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
