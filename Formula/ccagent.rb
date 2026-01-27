class Ccagent < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/presmihaylov/ccagent"
  license "MIT"
  version "0.0.50"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-darwin-arm64"
      sha256 "d1518fbaed4942bada1b5ff9cf76df347cf3e7f0f61f17b6714663481085071b"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-darwin-x86_64"
      sha256 "f13c81673bbdd7fa4986356f1bfd202b77ebfffb1197a074b771444181b52a77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-linux-arm64"
      sha256 "90a7c0e0052100f43e8eba26eb11ea2ed5619599d0ede8f0d00bd235307da28e"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-linux-x86_64"
      sha256 "0d14333f898f417c79c5f7514d2772c68712de6f38843e28da3e583f819bea01"
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
