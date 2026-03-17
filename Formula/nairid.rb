class Nairid < Formula
  desc "Nairi agent daemon"
  homepage "https://github.com/nairiai/nairid"
  license "MIT"
  version "0.0.102"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-darwin-arm64"
      sha256 "79a90bfdf4137db596ce68a8c1f34c3a6e7122f52cadd8c22fa2b0e3b4fe04ad"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-darwin-x86_64"
      sha256 "432985491873af3a9e4f1b248b4da681353a985183033bc7423f9868a9434de1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-linux-arm64"
      sha256 "00499e4bca28966853d39197895714aa50f37e3015b54b6f1fcb87df47714390"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-linux-x86_64"
      sha256 "52b5db586f643ec4ec41a4a774a419e0db9c146f6951cfdc85664b7539341790"
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
