cask "nicotine-plus-nightly" do
  version "20260804"

  on_arm do
    sha256 "d0578979334bcde50ec4ccef7d217779b6986ab06562d4efe63f8c950904d79e"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260804/Nicotine+-3.4.0.dev1-arm64-20260804.dmg"
  end

  on_intel do
    sha256 "4a32e3abd2594bf6499a01c825c949f0709b8bcb26c9fbe56b5332421007e665"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260804/Nicotine+-3.4.0.dev1-x86_64-20260804.dmg"
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
