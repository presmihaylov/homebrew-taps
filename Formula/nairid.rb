class Nairid < Formula
  desc "Nairi agent daemon"
  homepage "https://github.com/nairiai/nairid"
  license "MIT"
  version "0.0.130"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-darwin-arm64"
      sha256 "ae11c15f67bca753a29b520d47e5719bf9a9dd93aafa66aff48758808c03bb99"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-darwin-x86_64"
      sha256 "b032766baef240af5d96db3f4530a694322f6b4a8f5e13dd65a013e13b1cc0e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-linux-arm64"
      sha256 "571532ae4c80576c0939d541c25448510305d9640278024252e5cf86e07a7680"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-linux-x86_64"
      sha256 "2a5d2305e31e02f233fb2448583dd977bb6c481bffcef74aca520ec8e5ea3382"
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
