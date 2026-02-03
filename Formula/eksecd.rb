class Eksecd < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/eksecai/eksecd"
  license "MIT"
  version "0.0.58"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-darwin-arm64"
      sha256 "066ef2a546583292765d565d5229c8b943cc29deaea911cdfa25d004b558c913"
    else
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-darwin-x86_64"
      sha256 "699113897fbf6d8fbb10274c512053dc54b165e7c01ac823da613563aeb460a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-linux-arm64"
      sha256 "5ac69dfc0719f10f702c58474b9947cf81c52d46cbfb7090fc7d3698ebc85626"
    else
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-linux-x86_64"
      sha256 "5a1f9f292220249d777d67e27f3f11e1e711b4d0bc806b9d79296b35a54e038b"
    end
  end

  def install
    downloaded_file = Dir["eksecd-*"].first
    bin.install downloaded_file => "eksecd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eksecd --version")
  end
end
