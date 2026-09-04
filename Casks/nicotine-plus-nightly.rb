cask "nicotine-plus-nightly" do
  version "20260904"

  on_arm do
    sha256 "74de46a017e64a76731546597c239d8a7c47c7af7eebad74a79e1aa8dfa79d5e"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260904/Nicotine+-3.4.0.dev1-arm64-20260904.dmg"
  end

  on_intel do
    sha256 "d3416adac93763e22876de2f8a2b53742cb43e0760a8c30eed3132e80fc649dc"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260904/Nicotine+-3.4.0.dev1-x86_64-20260904.dmg"
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
