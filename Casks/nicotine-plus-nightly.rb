cask "nicotine-plus-nightly" do
  version "20260903"

  on_arm do
    sha256 "5ff74b27f947a0284617520d61686577a07395265cbde642192428d79f954dab"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260903/Nicotine+-3.4.0.dev1-arm64-20260903.dmg"
  end

  on_intel do
    sha256 "2f924d331e7145375e922ecf67aa1f9bf8c4234c0014e25af20c71b745e1795b"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260903/Nicotine+-3.4.0.dev1-x86_64-20260903.dmg"
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
