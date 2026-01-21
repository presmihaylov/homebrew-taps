class Ccagent < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/presmihaylov/ccagent"
  license "MIT"
  version "0.0.47"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-darwin-arm64"
      sha256 "00f0a5c940506269c30c59ef8ee99dc9205991052ac4b176cbf95fa58076d31e"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-darwin-x86_64"
      sha256 "ed2be4f931aff3d8163898ae13a76fdf7630dfa27241d249ffcd552cbc27bf46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-linux-arm64"
      sha256 "bdd4039ed72e1469c90cdb45996281170465781586fc1db7307ee465d4151820"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-linux-x86_64"
      sha256 "c7b9ba5909b3d835d53596b1865436583bf73d5ab126fa37d1706a16a83eed2a"
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
