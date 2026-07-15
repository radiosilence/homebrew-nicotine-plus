cask "nicotine-plus-nightly" do
  version "20260715"

  on_arm do
    sha256 "be06431f5ccdd326453a811c9994a6db04229d332ea7ec29da30ef3f9f225d58"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260715/Nicotine+-3.4.0.dev1-arm64-20260715.dmg"
  end

  on_intel do
    sha256 "af1f32c6fc8a874370ba6f71f976ab895d9f2c6e1cf847aa84b4082d49f74a33"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260715/Nicotine+-3.4.0.dev1-x86_64-20260715.dmg"
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
