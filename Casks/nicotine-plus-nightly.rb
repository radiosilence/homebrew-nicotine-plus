cask "nicotine-plus-nightly" do
  version "20260514"

  on_arm do
    sha256 "5c4fee7b954a7e310a308495a8d86573de175f595c2a0e3828a4dfcf8ddb4aea"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260514/Nicotine+-3.4.0.dev1-arm64-20260514.dmg"
  end

  on_intel do
    sha256 "571000eb8521407e63bbdbae1fe43ee336857d2cd4cbfed9f8af5ce23b909e69"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260514/Nicotine+-3.4.0.dev1-x86_64-20260514.dmg"
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
