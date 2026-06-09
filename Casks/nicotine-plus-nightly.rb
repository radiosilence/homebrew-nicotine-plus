cask "nicotine-plus-nightly" do
  version "20260609"

  on_arm do
    sha256 "ec4749487ad19463565788a69f589f27ce683dcc9de6dc734c4d928c240ddd9c"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260609/Nicotine+-3.4.0.dev1-arm64-20260609.dmg"
  end

  on_intel do
    sha256 "78481a2e09d0bd389e50264239941dc8daaecf8fb0a1d8aaac873426b2cae85b"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260609/Nicotine+-3.4.0.dev1-x86_64-20260609.dmg"
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
