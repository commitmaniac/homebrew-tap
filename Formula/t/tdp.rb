class Tdp < Formula
  desc "Parse your downloaded TikTok data"
  homepage "https://github.com/commitmaniac/tdp"
  url "https://github.com/commitmaniac/tdp/archive/refs/tags/1.1.0.tar.gz"
  sha256 "e88e0d6b8990294b921a4d3260e292d1c5e46a6f16e92a798789e1640db9173c"
  license "BSD-3-Clause"
  head "https://github.com/commitmaniac/tdp.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/commitmaniac/tap"
    sha256 cellar: :any,                 arm64_sequoia: "5af7905180a82a3bc52ee95c362154106b054ddd52c98ecdbb3ec520ccd41b7c"
    sha256 cellar: :any,                 arm64_sonoma:  "3df5304379bfaf6870145e720cbc9478f4286c5af6ae5b4f2f50c3e3fd69063c"
    sha256 cellar: :any,                 ventura:       "86cc52a511d8ed948137cb508c2d8170f764772828dca94a94cac0d4228459d9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "95df1f8c7c50ef2be185afd8d51a72e46a301b0cc73fd0a12bad051fa19a8c11"
  end

  depends_on "pkgconf" => :build
  depends_on "cjson"

  def install
    system "make"
    bin.install "tdp"
  end

  test do
    err_msg = "Error: no data file provided"
    assert_match err_msg, shell_output("#{bin}/tdp -liked 2>&1", 1)
  end
end
