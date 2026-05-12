cask "nicotine-plus-nightly" do
  version "20260512"

  on_arm do
    sha256 "a63f180e4918fc35220a9c69efd2f861abaa97ae0f0e65cc4f5f31ee63d54f5a"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260512/Nicotine+-3.4.0.dev1-arm64-20260512.dmg"
  end

  on_intel do
    sha256 "c3624014e1a3285c17e0bcfceaa45ae2089f8e6003e0a9ef7243a4f313106227"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260512/Nicotine+-3.4.0.dev1-x86_64-20260512.dmg"
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
