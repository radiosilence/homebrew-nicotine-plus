cask "nicotine-plus-nightly" do
  version "20260320"

  on_arm do
    sha256 "611721f515e6f65a0c66cdabda196d4017d842b01cec352c907f167b8671b935"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260320/Nicotine+-3.4.0.dev1-arm64-20260320.dmg"
  end

  on_intel do
    sha256 "61b34f994eac9dd12266f36cb5a06ab5e01aab2b8c3fbaf3328ca4cbf92e1825"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260320/Nicotine+-3.4.0.dev1-x86_64-20260320.dmg"
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
