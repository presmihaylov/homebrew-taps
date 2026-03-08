class Eksecd < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/nairiai/nairid"
  license "MIT"
  version "0.0.98"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/eksecd-#{version}-darwin-arm64"
      sha256 "cf703f79db887df35896fb1439b24661c8ec5ac1b74a97192260c82ff1e64c6c"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/eksecd-#{version}-darwin-x86_64"
      sha256 "6456d9a1fbb706663e20792024b08f857d020e3f8cd68d17491085c111a53acc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/eksecd-#{version}-linux-arm64"
      sha256 "a44f46ad61b0e44970cd3a23e6853fcd71f0a6208ad36f14497f934bab759ca7"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/eksecd-#{version}-linux-x86_64"
      sha256 "fd0c9d7ff97c0e0d972f714577098b1708ff0a360a7ee7a7efa080cc0594133e"
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
