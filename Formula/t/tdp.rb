class Tdp < Formula
  desc "Parse your downloaded TikTok data"
  homepage "https://github.com/commitmaniac/tdp"
  url "https://github.com/commitmaniac/tdp/archive/refs/tags/1.0.1.tar.gz"
  sha256 "03d129dac52b5c9b96467241b0f85d9b209ba130e0b5d74687e4af7893fb86ce"
  license "BSD-3-Clause"
  head "https://github.com/commitmaniac/tdp.git", branch: "master"

  depends_on "pkgconf" => :build
  depends_on "cjson"

  def install
    system "make"
    bin.install "tdp"
  end

  test do
    err_msg = "Error: no input file provided"
    assert_match err_msg, shell_output(bin/"tdp -liked 2>&1", 1)
  end
end
