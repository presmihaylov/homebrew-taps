# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Todocheck < Formula
  desc "A static-code analyzer, ensuring your TODOs are linked to your issue tracker"
  homepage "https://github.com/preslavmihaylov/todocheck"
  url "https://github.com/preslavmihaylov/todocheck/archive/refs/tags/v0.3.0.zip"
  version "0.3.0"
  sha256 "297138f2d7a534b64531e1eff4f314c26da74c14a217052326189ae10f493a23"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X 'main.version=%s'" % version, "-o", "todocheck"
    bin.install "todocheck"
  end

  test do
    system "false"
  end
end
