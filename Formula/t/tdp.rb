class Tdp < Formula
  desc "Parse your downloaded TikTok data"
  homepage "https://github.com/commitmaniac/tdp"
  url "https://github.com/commitmaniac/tdp/archive/refs/tags/1.0.1.tar.gz"
  sha256 "03d129dac52b5c9b96467241b0f85d9b209ba130e0b5d74687e4af7893fb86ce"
  license "BSD-3-Clause"
  head "https://github.com/commitmaniac/tdp.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/commitmaniac/tap"
    sha256 cellar: :any,                 arm64_sequoia: "38b4bf1665a2cd766283aff49a20a5532679cf9185a1db0dda3bc6b4fd0e486d"
    sha256 cellar: :any,                 arm64_sonoma:  "cee65d6844c839642179820277e2531c9d639c008191503b63ba55cf8f1d35b8"
    sha256 cellar: :any,                 ventura:       "2d29868e6831c9a5a5bac15f840200a91d9dc1b5af85857d6d3c5649ff9afc75"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3de0c51ace1c506813583948f8a30f503b5b342b44ef3ceb419a32f990fca03e"
  end

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
