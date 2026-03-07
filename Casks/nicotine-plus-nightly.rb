cask "nicotine-plus-nightly" do
  version "20260307"

  on_arm do
    sha256 "4163515b54ba768ce29304ef713b215e62edbbba8513b92b85f1d53dbbffc1e6"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260307/Nicotine+-3.4.0.dev1-arm64-20260307.dmg"
  end

  on_intel do
    sha256 "56303997c6befcee4e7a1369ea847c9c41d061a3f8edd2ec8cc6d6963ee40566"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260307/Nicotine+-3.4.0.dev1-x86_64-20260307.dmg"
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
