class Ccagent < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/presmihaylov/ccagent"
  license "MIT"
  version "0.0.3"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-arm64"
      sha256 "Getting SHA256 for ccagent-v0.0.3-darwin-arm64...
0880333b6880773174cbbf81aab4a9709b000ba5e60b0fb625553ce66f24f3ac"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-x86_64"
      sha256 "Getting SHA256 for ccagent-v0.0.3-darwin-x86_64...
46a575f5ec512e5ed5d0be2ab32ded02f76b5de34feeb8e621e3e2f02ea12d40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-arm64"
      sha256 "Getting SHA256 for ccagent-v0.0.3-linux-arm64...
737f08a066999a3d726302092a77ac5f1fa1d7c49295ac346f3a3e9a10c0d53e"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-x86_64"
      sha256 "Getting SHA256 for ccagent-v0.0.3-linux-x86_64...
49f7be541474825121d51f18bf65e0ff3ac562c1069262ade8dceaddfb4f7e11"
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
