cask "nicotine-plus-nightly" do
  version "20260711"

  on_arm do
    sha256 "55fbd5a9e33c4ff772cf2acc742de7731f1ec145c17d642dd0cff8b604e44d3a"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260711/Nicotine+-3.4.0.dev1-arm64-20260711.dmg"
  end

  on_intel do
    sha256 "6a5d844d60c4c4b1e41e903927e6f7f58698ef1ca8ebc711b1dc5e41a9fc1612"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260711/Nicotine+-3.4.0.dev1-x86_64-20260711.dmg"
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
