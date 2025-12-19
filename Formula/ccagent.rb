class Ccagent < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/presmihaylov/ccagent"
  license "MIT"
  version "0.0.26"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-arm64"
      sha256 "22c91d6be8e74d4e0a26430df609e2815bfbad1d80cc181905ecab91a85337c9"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-x86_64"
      sha256 "294edb6a1885c39f1de358326ba877e1ed6f08bb8d06e761c02c4d7531b5a4ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-arm64"
      sha256 "450a69d69610be623f644768ae8fd955e95fbb10978d9d3cfcc58e3ea7d0bfdf"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-x86_64"
      sha256 "41d4e5b364c008ab3abad8d9b4c93f62ad75e74128362c03c0e1676221647537"
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
