class Eksecd < Formula
  desc "CLI agent for Claude Code integration with Socket.IO backend"
  homepage "https://github.com/eksecai/eksecd"
  license "MIT"
  version "0.0.65"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-darwin-arm64"
      sha256 "70f1f19b6da3f87394801eef3df86bde4e4573bfb146261ca7719cbc0c88ec24"
    else
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-darwin-x86_64"
      sha256 "be65cbae85dd9ee5227d6f8b94b259dab43ce1199309735792eb990a2449d91c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-linux-arm64"
      sha256 "4172ec0a075bc42ecb8f8d9872cab3c1cdaae7eb5f51d580ef672caacfab117f"
    else
      url "https://github.com/eksecai/eksecd/releases/download/#{version}/eksecd-#{version}-linux-x86_64"
      sha256 "799ecf23fa701ddd7ed9ca9149b136ddb89aabc7af49306b3702073cea298ed3"
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
