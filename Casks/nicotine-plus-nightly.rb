cask "nicotine-plus-nightly" do
  version "20260620"

  on_arm do
    sha256 "654ea97166cbbbf246c4bc5c8132e0bf29cbfee11b59a9dd9a0faf9463454abd"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260620/Nicotine+-3.4.0.dev1-arm64-20260620.dmg"
  end

  on_intel do
    sha256 "a90a581da73ebba8ee5acc02f5052a89a73179428dd0caf68f6b981f394cfe56"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260620/Nicotine+-3.4.0.dev1-x86_64-20260620.dmg"
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
