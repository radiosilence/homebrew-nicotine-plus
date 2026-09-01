cask "nicotine-plus-nightly" do
  version "20260901"

  on_arm do
    sha256 "e7c5d437c1457895956d24302788c3135620157024a8cdd3cad98e387a3ca7b7"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260901/Nicotine+-3.4.0.dev1-arm64-20260901.dmg"
  end

  on_intel do
    sha256 "20ff4f048acefddc50e76b8ea5a7c28d4aa1e61957f6763b30648890a747f110"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260901/Nicotine+-3.4.0.dev1-x86_64-20260901.dmg"
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
