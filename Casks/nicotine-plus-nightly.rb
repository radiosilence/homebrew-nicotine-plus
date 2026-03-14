cask "nicotine-plus-nightly" do
  version "20260314"

  on_arm do
    sha256 "ac19ea92312573098745775a760c5a47330a09e4162f77f110ee26ade2418441"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260314/Nicotine+-3.4.0.dev1-arm64-20260314.dmg"
  end

  on_intel do
    sha256 "e24a0e6757bdf7f317851deefed0bc4cd6e86a3f2e41a598f4084303a0445c99"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260314/Nicotine+-3.4.0.dev1-x86_64-20260314.dmg"
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
