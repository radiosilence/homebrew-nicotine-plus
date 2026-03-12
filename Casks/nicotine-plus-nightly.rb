cask "nicotine-plus-nightly" do
  version "20260312"

  on_arm do
    sha256 "51d6573a720971688f4b0bc231777a4ddf5f8c972f15363b867fba5ecedd34a4"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260312/Nicotine+-3.4.0.dev1-arm64-20260312.dmg"
  end

  on_intel do
    sha256 "2db4ce8074ebec2200811b4c8114e555213163ddd2818e3c684558fa7a113121"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260312/Nicotine+-3.4.0.dev1-x86_64-20260312.dmg"
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
