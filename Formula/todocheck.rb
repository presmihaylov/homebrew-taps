# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Todocheck < Formula
  desc "A static-code analyzer, ensuring your TODOs are linked to your issue tracker"
  homepage "https://github.com/preslavmihaylov/todocheck"
  url "https://github.com/preslavmihaylov/todocheck/archive/refs/tags/v0.6.0.zip"
  version "0.6.0"

  # generate \w shasum -a 256 path/to/file
  sha256 "1cc57b76522f1d12a9f8f4cdf8386d83f1e7d209b151ac58840f48e4c6315316" 
  license "MIT"

  depends_on "go" => :build

  def install
    # fix for https://github.com/golang/go/issues/51706
    system "go", "get", "-u", "golang.org/x/sys" 
    system "go", "build", "-ldflags", "-X 'main.version=%s'" % version, "-o", "todocheck"
    bin.install "todocheck"
  end

  test do
    system "false"
  end
end
