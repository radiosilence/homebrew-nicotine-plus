cask "nicotine-plus-nightly" do
  version "20260801"

  on_arm do
    sha256 "78123c54a03687ab4edd4f306686fbcd7c0fdf1d24f050845281df67ad8ffbda"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260801/Nicotine+-3.4.0.dev1-arm64-20260801.dmg"
  end

  on_intel do
    sha256 "f4710631eadc33cc806e0ad5da90f29ffc6f3cc4a7dae5f7e39e69521b53b8b3"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260801/Nicotine+-3.4.0.dev1-x86_64-20260801.dmg"
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
