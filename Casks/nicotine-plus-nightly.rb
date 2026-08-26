cask "nicotine-plus-nightly" do
  version "20260826"

  on_arm do
    sha256 "f2dd02fc883d2c2db508a61602b6b51f4c2865dcd720dec7a2c3e45b93745b26"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260826/Nicotine+-3.4.0.dev1-arm64-20260826.dmg"
  end

  on_intel do
    sha256 "e7dbc39697b8596367b37fa7d1a88d0aa5c61851f17cc9804298208a8e39a346"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260826/Nicotine+-3.4.0.dev1-x86_64-20260826.dmg"
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
