cask "nicotine-plus-nightly" do
  version "20260310"

  on_arm do
    sha256 "e59fb68cff15760e2e7b6bda3188bc9460b586ec2ebc177d4acbf102983b0f12"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260310/Nicotine+-3.4.0.dev1-arm64-20260310.dmg"
  end

  on_intel do
    sha256 "d88b79f0ad7098a17bbdfa912861b20ac96162cb7221ba6a62c2ee4b63c0be8c"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260310/Nicotine+-3.4.0.dev1-x86_64-20260310.dmg"
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
