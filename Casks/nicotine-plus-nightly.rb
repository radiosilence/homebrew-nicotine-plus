cask "nicotine-plus-nightly" do
  version "20260718"

  on_arm do
    sha256 "eb5b0f9dd63dca27438e13fec66a91d46d2a4b451a74d9148ee942cdc583f60e"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260718/Nicotine+-3.4.0.dev1-arm64-20260718.dmg"
  end

  on_intel do
    sha256 "cb948b4232bc5f62b69c8034e017fe77861714a846f8149fb3e8ee73061c1885"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260718/Nicotine+-3.4.0.dev1-x86_64-20260718.dmg"
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
