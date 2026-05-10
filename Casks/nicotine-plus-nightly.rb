cask "nicotine-plus-nightly" do
  version "20260510"

  on_arm do
    sha256 "ad2c542abb9e38fba4190fb0cda1a6f2f0a80462c288c3a10409b48d0709babb"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260510/Nicotine+-3.4.0.dev1-arm64-20260510.dmg"
  end

  on_intel do
    sha256 "31fe1c955c4ba854d8df876501500f96cfea8d1a1d67bac9144e5390546992f7"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260510/Nicotine+-3.4.0.dev1-x86_64-20260510.dmg"
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
