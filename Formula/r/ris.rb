class Ris < Formula
  desc "Rename in sequence"
  homepage "https://github.com/commitmaniac/ris"
  url "https://github.com/commitmaniac/ris/archive/refs/tags/1.1.0.tar.gz"
  sha256 "a8ee68e7f9eecfefb1c10ca539677b81345311b9cb38fe41a439879228db55e5"
  license "BSD-3-Clause"
  head "https://github.com/commitmaniac/ris.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output(bin/"ris -version")
  end
end
