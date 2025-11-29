class Ccagent < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/presmihaylov/ccagent"
  license "MIT"
  version "0.0.22"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-arm64"
      sha256 "d9b40895e0db5ec4747a7f8b6a8932b3513efb789fb44b947f298676a623fd63"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-x86_64"
      sha256 "f29b7f3eb26f2ad52d7b6c7bb05eabef7960e18646efd30f31ea7a012f1eb76d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-arm64"
      sha256 "f866259f17aa7f9e4af5dfd9575694706e19603c6255deb3a016333f0795c10a"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-x86_64"
      sha256 "9f88b8c738db15ea7b8c0f85f8cbf13a17e014f0b415ac4a879d96d757dc0606"
    end
  end

  def install
    # The downloaded file will have the full name, rename to just 'ccagent'
    downloaded_file = Dir["ccagent-*"].first
    bin.install downloaded_file => "ccagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccagent --version")
  end
end
