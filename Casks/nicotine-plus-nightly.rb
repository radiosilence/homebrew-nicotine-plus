cask "nicotine-plus-nightly" do
  version "20260731"

  on_arm do
    sha256 "6d56810c00f6354cc776a47462c557b85936025c8d3b812a1201f5a01f1fe085"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260731/Nicotine+-3.4.0.dev1-arm64-20260731.dmg"
  end

  on_intel do
    sha256 "8c200c59e8e5a14392f73d036e48cfdd47fb621cdaa8a0a832b893ba0d600cb2"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260731/Nicotine+-3.4.0.dev1-x86_64-20260731.dmg"
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
