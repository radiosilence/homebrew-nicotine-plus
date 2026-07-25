cask "nicotine-plus-nightly" do
  version "20260725"

  on_arm do
    sha256 "b1ffbec411756ef3910b55f916be25c3b553baa331038035f4d99a05e60aceb5"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260725/Nicotine+-3.4.0.dev1-arm64-20260725.dmg"
  end

  on_intel do
    sha256 "446125cf4365470cd3bd63f96b8f0b162ecdfce2e3820856cb4f56f063b7c2e7"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260725/Nicotine+-3.4.0.dev1-x86_64-20260725.dmg"
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
