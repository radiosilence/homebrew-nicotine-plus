cask "nicotine-plus-nightly" do
  version "20260318"

  on_arm do
    sha256 "6efc6bbaee226ad49097ea3666f7cb01e8c9422e85676204ef3616159bd51c0e"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260318/Nicotine+-3.4.0.dev1-arm64-20260318.dmg"
  end

  on_intel do
    sha256 "b9ef2dda9744232fd3b0da6ca41488be6a869add17a7f66e4083e41281b37e84"
    url "https://github.com/radiosilence/nicotine-plus/releases/download/nightly-20260318/Nicotine+-3.4.0.dev1-x86_64-20260318.dmg"
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
