class Ccagent < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/presmihaylov/ccagent"
  license "MIT"
  version "0.0.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-darwin-arm64"
      sha256 "4daa4b5f08583bcfe2215839013eabf5f8be73ea9bf4081f7edb83840a465035"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-darwin-x86_64"
      sha256 "5a66dca4e5871be2bb10dc8af294ca41ea7f30c19cba01c2b36482ffff0185a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-linux-arm64"
      sha256 "6a2031c63b676f89d46dca7bba89cda4eb999f72cfecee6ce07319fe1994fc53"
    else
      url "https://github.com/presmihaylov/ccagent/releases/download/#{version}/ccagent-#{version}-linux-x86_64"
      sha256 "198a5ee56e8a18c9904141af39bb3ce1d8edcc48999a4a1352e0dd80e2c2bfaf"
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
