cask "nicotine-plus-nightly" do
  version "20260707"

  on_arm do
    sha256 "ae3591b06c405e2273c3011d4bee7980630980aa0f7260f1b70f2cc8820f7c3e"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260707/Nicotine+-3.4.0.dev1-arm64-20260707.dmg"
  end

  on_intel do
    sha256 "0476391a1a94d692f1e97f0d6257e02bad5d65e858bfa774c9e58c1a68d75244"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260707/Nicotine+-3.4.0.dev1-x86_64-20260707.dmg"
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
