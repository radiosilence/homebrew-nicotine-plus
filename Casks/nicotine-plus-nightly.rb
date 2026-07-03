cask "nicotine-plus-nightly" do
  version "20260703"

  on_arm do
    sha256 "02d448f987872b291826cfc43d8f0edb23b2d1157f22e6e7fa01725277850ebc"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260703/Nicotine+-3.4.0.dev1-arm64-20260703.dmg"
  end

  on_intel do
    sha256 "a892fc6459a299d18e8545376ee51bfac1e6cef854440ed92b629264240cd552"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260703/Nicotine+-3.4.0.dev1-x86_64-20260703.dmg"
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
