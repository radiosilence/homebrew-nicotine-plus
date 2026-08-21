cask "nicotine-plus-nightly" do
  version "20260821"

  on_arm do
    sha256 "d0981d6e01d4c978caa8f6c724b081528d713c0cd3804f7c44712b3d649531f0"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260821/Nicotine+-3.4.0.dev1-arm64-20260821.dmg"
  end

  on_intel do
    sha256 "f9f215c98e07f60ad0c89a4fb56ff1ee5c7f931ded279b843f395e2c7c8995cd"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260821/Nicotine+-3.4.0.dev1-x86_64-20260821.dmg"
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
