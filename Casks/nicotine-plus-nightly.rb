cask "nicotine-plus-nightly" do
  version "20260823"

  on_arm do
    sha256 "1a439eee528e62201a537ee898d1eac7dd6e57e937984937c92fb5a309d33758"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260823/Nicotine+-3.4.0.dev1-arm64-20260823.dmg"
  end

  on_intel do
    sha256 "157671aba25de7a2f0580f09918991b16343b0d96bd9ce6dcdd2619a0264c19c"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260823/Nicotine+-3.4.0.dev1-x86_64-20260823.dmg"
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
