class Tdp < Formula
  desc "Parse your downloaded TikTok data"
  homepage "https://github.com/commitmaniac/tdp"
  url "https://github.com/commitmaniac/tdp/archive/refs/tags/1.1.0.tar.gz"
  sha256 "e88e0d6b8990294b921a4d3260e292d1c5e46a6f16e92a798789e1640db9173c"
  license "BSD-3-Clause"
  head "https://github.com/commitmaniac/tdp.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/commitmaniac/tap"
    sha256 cellar: :any,                 arm64_tahoe:   "419ab323d9177d4b8a733594ebb5a9224247feb4d73f0d2e9cdaae08a76afa89"
    sha256 cellar: :any,                 arm64_sequoia: "2c84f5cdc71b325f0b6829db251cd34fdff6f72f2efa738d7f23702c08e39612"
    sha256 cellar: :any,                 arm64_sonoma:  "ca7f33ddc483cfa4a3483bd19ba7a6930469d7b67bdec2eaf9cafdbf5881303a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "42ae9fcbc3654f43a2d7249c417aef3560510b64b52894c443136a69d76e0f21"
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
