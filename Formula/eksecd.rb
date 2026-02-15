class Eksecd < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/eksecai/eksecd"
  license "MIT"
  version "0.0.80"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-darwin-arm64"
      sha256 "46a7fc9e90056df9699c55129317499bfa9cd14810d31c987a145109788c3584"
    else
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-darwin-x86_64"
      sha256 "e44a73b55d1aadb0d10eb44c45f5769ca97bbd386e79e3d66d4f0f3596aae1b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-linux-arm64"
      sha256 "e7d4e5e706e1ceb3fcaf1cb39275fde0a3a705f26d03add1ce357c15c4192ba0"
    else
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-linux-x86_64"
      sha256 "dff24a5e905af164745cb290e0bcb5b90e7181277dda45fa1608f4eca415332f"
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
