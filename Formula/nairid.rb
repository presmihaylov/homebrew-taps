class Nairid < Formula
  desc "Nairi agent daemon"
  homepage "https://github.com/nairiai/nairid"
  license "MIT"
  version "0.0.135"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-darwin-arm64"
      sha256 "d4e6c570e50cd0a07e88754d1798758c1dc4bf31f09477d937c82625d0f59b87"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-darwin-x86_64"
      sha256 "00d314cff48bd457f57fdecc5fcf29f6240e84d9c0932ba15f552c88feb02633"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-linux-arm64"
      sha256 "9d72f110d9a46c19b290d4ab37ceca757d8b0333d261005509882ac24af44b74"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-linux-x86_64"
      sha256 "c78b561ff3c3b5a12d29d4de3f2399003b6ff23c279f051f3c795e68fd92b905"
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
