class Eksecd < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/eksecai/eksecd"
  license "MIT"
  version "0.0.83"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-darwin-arm64"
      sha256 "27b072b4a1fd9fa768707b65c3e2e1e801ab3d220e2482405c3785c0f605c11b"
    else
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-darwin-x86_64"
      sha256 "801ecaf45fe89bf33cf14aa1ee8869116725d30d05f713daf0235078999f45fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-linux-arm64"
      sha256 "6ab405f359e687787416c46713355e16610cd661a6d4bb28a35700b028fbdae0"
    else
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-linux-x86_64"
      sha256 "1e5a08683398f3ba13a306a57762aab7ea0481482b3b84c9ef1da9c1170c7c59"
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
