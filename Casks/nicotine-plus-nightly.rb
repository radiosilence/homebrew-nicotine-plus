cask "nicotine-plus-nightly" do
  version "20260606"

  on_arm do
    sha256 "11d00f9ddc3f303d24ae68f2759e7de32876450d84b63a502e08eb675254da60"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260606/Nicotine+-3.4.0.dev1-arm64-20260606.dmg"
  end

  on_intel do
    sha256 "d9c2dc576bbe435af8f7daa8e4ae39b19afe0abdaa4e3388ec2f4396c29f1ab2"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260606/Nicotine+-3.4.0.dev1-x86_64-20260606.dmg"
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
