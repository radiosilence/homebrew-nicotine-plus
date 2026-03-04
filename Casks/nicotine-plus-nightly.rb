cask "nicotine-plus-nightly" do
  version "20260304"
  sha256 "placeholder"

  url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-#{version}/Nicotine+-arm64-#{version}.dmg"
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
