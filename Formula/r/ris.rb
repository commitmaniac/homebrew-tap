class Ris < Formula
  desc "Rename in sequence"
  homepage "https://github.com/commitmaniac/ris"
  url "https://github.com/commitmaniac/ris/archive/refs/tags/1.2.0.tar.gz"
  sha256 "1e7a2497f51f141d8d1c044949ffd048fdb766e2fd2279ea5ef37f422ae835d2"
  license "BSD-3-Clause"
  head "https://github.com/commitmaniac/ris.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/commitmaniac/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "57927bffb64e08b5ddfcc82be85f443083936b7e5b62e82f6b2b9034a4143213"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "57927bffb64e08b5ddfcc82be85f443083936b7e5b62e82f6b2b9034a4143213"
    sha256 cellar: :any_skip_relocation, ventura:       "c0f9346305de8c3faf733716f36e6749adcc8ef4370ae041f7c5a5ba0323e256"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0a9d99d925ac7b158869e447fb6c1e5892cb17f4a6ff4cfd76d62ff4fa27aac3"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output(bin/"ris -version")
  end
end
