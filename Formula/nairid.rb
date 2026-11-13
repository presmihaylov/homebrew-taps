class Nairid < Formula
  desc "Nairi agent daemon"
  homepage "https://github.com/nairiai/nairid"
  license "MIT"
  version "0.0.141"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-darwin-arm64"
      sha256 "09bd8a4ab35988f2387b93cb15977e6066dbc3ccffab3ba493fae34025f49bcb"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-darwin-x86_64"
      sha256 "63c77a34132cb215c0923973911692f9d392f0195f2dcd9c5a7bd359d505d30a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-linux-arm64"
      sha256 "541e39807f6c96fb4309fd069d28f90800b1a703cc02ff5dca0e33349f893523"
    else
      url "https://github.com/nairiai/nairid/releases/download/#{version}/nairid-#{version}-linux-x86_64"
      sha256 "76704c0ff24fc81351c349bc4e4d962e5324b2531525b59d192d8ccad2986338"
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
