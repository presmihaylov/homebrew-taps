class Nairid < Formula
  desc "Nairi agent daemon"
  homepage "https://github.com/nairiai/nairid"
  license "MIT"
  version "0.0.100"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-darwin-arm64"
      sha256 "93aa021ea6e8dcb3c51d8d454c2510383d821739b9f7710fd02e8dfb40b761a1"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-darwin-x86_64"
      sha256 "e367f3ebf7390293a03438c8084f5c124dbbfd8d7132f5702d45141cde1e7873"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-linux-arm64"
      sha256 "79c12ee67b1aec233f8fa509730e3e0cf9eba8ac809c6b4d91b605d2e4de3afc"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-linux-x86_64"
      sha256 "82787dc074e5cb105de0de7836f99960e520d42ca9d2d4557373ddc094a84d00"
    end
  end

  def install
    downloaded_file = Dir["nairid-*"].first
    bin.install downloaded_file => "nairid"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nairid --version")
  end
end
