cask "nicotine-plus-nightly" do
  version "20260313"

  on_arm do
    sha256 "8fd86d2e12296b6eecd914074a9f4ae0efd5f78ab1b8b9edf93538a59fbf0a9a"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260313/Nicotine+-3.4.0.dev1-arm64-20260313.dmg"
  end

  on_intel do
    sha256 "9983101cd7ab4b62c4bb0362c61ea1dfe4e5d8a158629b59ba27ba5aec80e7c4"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260313/Nicotine+-3.4.0.dev1-x86_64-20260313.dmg"
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
