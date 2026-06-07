cask "nicotine-plus-nightly" do
  version "20260607"

  on_arm do
    sha256 "b2229c68c6c18b04ab3b7d545e2b3b92c5a6b4f4086cdc880cb5445bc302273f"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260607/Nicotine+-3.4.0.dev1-arm64-20260607.dmg"
  end

  on_intel do
    sha256 "b6916190368cee624f771bd8562366f54ae57edab991d56885b9534940328feb"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260607/Nicotine+-3.4.0.dev1-x86_64-20260607.dmg"
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
