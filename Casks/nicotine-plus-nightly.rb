cask "nicotine-plus-nightly" do
  version "20260818"

  on_arm do
    sha256 "1403cebfeb22c243d8408a45a8e8954f0a343b818681f26108c5460408c78ccb"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260818/Nicotine+-3.4.0.dev1-arm64-20260818.dmg"
  end

  on_intel do
    sha256 "b838757b1f467c677597a978c85b914e23ffbe6e456ae886dbbef0196e1d8942"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260818/Nicotine+-3.4.0.dev1-x86_64-20260818.dmg"
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
