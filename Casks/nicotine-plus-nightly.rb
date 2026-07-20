cask "nicotine-plus-nightly" do
  version "20260720"

  on_arm do
    sha256 "767039bfdf95db49073a943047bae0a3d023bc321acebe1781bd6685228642b7"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260720/Nicotine+-3.4.0.dev1-arm64-20260720.dmg"
  end

  on_intel do
    sha256 "90bf2851f079eec0491dde95005923fc06dd572c2ed6346b90469e5c1f8bf14e"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260720/Nicotine+-3.4.0.dev1-x86_64-20260720.dmg"
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
