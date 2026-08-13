cask "nicotine-plus-nightly" do
  version "20260813"

  on_arm do
    sha256 "7fb439379a02e067297f8ece8bdcfbce3be4ded8e4930a036c0e4505aa7df088"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260813/Nicotine+-3.4.0.dev1-arm64-20260813.dmg"
  end

  on_intel do
    sha256 "29061b41986c92cc919d98587d12abe992a64284e216180c6fe814c252026642"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260813/Nicotine+-3.4.0.dev1-x86_64-20260813.dmg"
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
