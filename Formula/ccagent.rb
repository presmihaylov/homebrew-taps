class Ccagent < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/presmihaylov/ccagent"
  license "MIT"
  version "0.1.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-arm64"
      sha256 "c504e61ded9099374bc6b689f3dd26388192e45e7d9246d056d05d92dccef829"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-x86_64"
      sha256 "ab7d1796dba16d9fda2f359cc6cdba02048e1b444a97f1093a36c337f066f18e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-arm64"
      sha256 "c0b639e53a7e5b572fadc784cf57ad9a9e4a506ade0d7363f79760ee47212075"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-x86_64"
      sha256 "44c59367d7c0bcb07e731ff2ce416686a7abd2527a31f1ebad11d74805d1f16b"
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
