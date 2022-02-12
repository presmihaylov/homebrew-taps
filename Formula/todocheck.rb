# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Todocheck < Formula
  desc "A static-code analyzer, ensuring your TODOs are linked to your issue tracker"
  homepage "https://github.com/preslavmihaylov/todocheck"
  url "https://github.com/preslavmihaylov/todocheck/archive/refs/tags/v0.5.0.zip"
  version "0.5.0"
  sha256 "b6ef774f5f13a6aaa57188e49bd7171897cf62739632c19f12b2ca74bfd94ee5"
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
