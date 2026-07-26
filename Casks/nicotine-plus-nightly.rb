cask "nicotine-plus-nightly" do
  version "20260726"

  on_arm do
    sha256 "57f8009441d41de69c0bce22e17a2645736f9a01d21ca35a6bf94d3f5def0b4a"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260726/Nicotine+-3.4.0.dev1-arm64-20260726.dmg"
  end

  on_intel do
    sha256 "b67c7b2c79d3e290b3d03e6d0bfbe5ffec5794d60461c8dae153021202fbc49b"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260726/Nicotine+-3.4.0.dev1-x86_64-20260726.dmg"
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
