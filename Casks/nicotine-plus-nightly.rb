cask "nicotine-plus-nightly" do
  version "20260713"

  on_arm do
    sha256 "de5ad844a348fe1a19f0f9027c9f367d25a3aa96d6382a5fe5d21f9ccc6374ed"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260713/Nicotine+-3.4.0.dev1-arm64-20260713.dmg"
  end

  on_intel do
    sha256 "e2dc0cf0f10b1dc8154f2ba9de820d43083db74508e63644a74b01bef8aca391"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260713/Nicotine+-3.4.0.dev1-x86_64-20260713.dmg"
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
