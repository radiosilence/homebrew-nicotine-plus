cask "nicotine-plus-nightly" do
  version "20260613"

  on_arm do
    sha256 "920451a556e525feffabb94d3246af5fcdb801254be45992604fbf89d570b993"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260613/Nicotine+-3.4.0.dev1-arm64-20260613.dmg"
  end

  on_intel do
    sha256 "9fe7cc4d73b37585a81c8da4be911f129726a5034c0f255e46de980ad43b4403"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260613/Nicotine+-3.4.0.dev1-x86_64-20260613.dmg"
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
