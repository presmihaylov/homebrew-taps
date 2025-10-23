class Ccagent < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/presmihaylov/ccagent"
  license "MIT"
  version "0.0.15"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-arm64"
      sha256 "cc6ec46c2c6fbef98ac2f1ebe6ee16d5ba4ef96765bc7e1627313efb037fb49c"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-darwin-x86_64"
      sha256 "ce702f46184871fbc2fcf1341300efdbaa88bfa19f0170cfaa1553742a1db636"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-arm64"
      sha256 "d423b8ca6102f0b4939e79ea324d7d1aa1c05df926585a73a6a86ddf2e277432"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/v#{version}/ccagent-v#{version}-linux-x86_64"
      sha256 "764c24c95c451fdc6fc7913a8fcf6337dd24a40c658a26586afdb652e51aa684"
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
