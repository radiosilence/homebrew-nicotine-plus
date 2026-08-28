cask "nicotine-plus-nightly" do
  version "20260828"

  on_arm do
    sha256 "5dbaaaec6e39b18e7b1514d55423adffdcf1de2999a3e87e6eab5fac4cdd21d4"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260828/Nicotine+-3.4.0.dev1-arm64-20260828.dmg"
  end

  on_intel do
    sha256 "5431b257447b5c0ef77400006696a6c7419a5366faf23b313d44d74ba04091b3"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260828/Nicotine+-3.4.0.dev1-x86_64-20260828.dmg"
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
