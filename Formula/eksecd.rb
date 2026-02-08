class Eksecd < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/eksecai/eksecd"
  license "MIT"
  version "0.0.67"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-darwin-arm64"
      sha256 "d9049833783dcf228e02e961f658775467042c2ef5468756803cab7e3f655a66"
    else
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-darwin-x86_64"
      sha256 "6de6f7904b558b6fc2fbdf5b26b7e22fa2c84e927e20867d98788e492cd14d5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-linux-arm64"
      sha256 "75fdebff008f8d2187593f9328bb3fdd70192f3ddce47d0416d8943d380d09cd"
    else
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-linux-x86_64"
      sha256 "91a9ae9cfc13a96191a71642ebe2979f360331df2abfc23ded25fa1e43ae7c4c"
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
