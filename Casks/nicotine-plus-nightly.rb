cask "nicotine-plus-nightly" do
  version "20260314"

  on_arm do
    sha256 "a6efc1940c6121ebf2b3921a9995da79cc0f221eca38885bf543144b6defffbb"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260314/Nicotine+-3.4.0.dev1-arm64-20260314.dmg"
  end

  on_intel do
    sha256 "d9f47da964de974a549f0378992b993de2161b5d62cad7f10f6db67eed308678"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260314/Nicotine+-3.4.0.dev1-x86_64-20260314.dmg"
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
