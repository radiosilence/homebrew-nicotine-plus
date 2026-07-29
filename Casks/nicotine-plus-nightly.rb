cask "nicotine-plus-nightly" do
  version "20260729"

  on_arm do
    sha256 "a43467c66c69bfb1dd0d721f5cf7921701c6caf2d7e64f19676ad476dfc7ff89"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260729/Nicotine+-3.4.0.dev1-arm64-20260729.dmg"
  end

  on_intel do
    sha256 "6d201fb159246c9a02b9f6c934dcff24b227a5d0b8d9d0ed673823ea0a24bfaf"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260729/Nicotine+-3.4.0.dev1-x86_64-20260729.dmg"
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
