class Ccagent < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/presmihaylov/ccagent"
  license "MIT"
  version "0.0.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-darwin-arm64"
      sha256 "cb0009bd71527084979cc649cbd5ca084c3b4c87a0737496051d732e7d25c954"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-darwin-x86_64"
      sha256 "4e19326ee2b9c2bcf6552421f6aa2eb3b7dfae730a17e43d5c96791839453eb7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-linux-arm64"
      sha256 "bfb8d21ed0ff37ea09e26e2098bcd221282b0b1169f9c6c9396c001a759ad170"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-linux-x86_64"
      sha256 "b0c0d275d144fd90e090f08bdb2af07d2f383a4b127d943b10f2d15e53a1c12d"
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
