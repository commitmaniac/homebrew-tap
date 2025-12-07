class Ris < Formula
  desc "Rename in sequence"
  homepage "https://github.com/commitmaniac/ris"
  url "https://github.com/commitmaniac/ris/archive/refs/tags/1.2.0.tar.gz"
  sha256 "1e7a2497f51f141d8d1c044949ffd048fdb766e2fd2279ea5ef37f422ae835d2"
  license "BSD-3-Clause"
  head "https://github.com/commitmaniac/ris.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/commitmaniac/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e23b74f209da20c6b97eeef27dff8c71a83d3f5abd80eaa809760678406314ef"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e23b74f209da20c6b97eeef27dff8c71a83d3f5abd80eaa809760678406314ef"
    sha256 cellar: :any_skip_relocation, ventura:       "664b84997b9610181feeb9cdb90dded56876eadcf95aa65fec5537dbed89a6ec"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "53141fd8ba2abc15ba4e5fdde693d4f7dcd37e938a0539583ce097ce62f27842"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
  end

  test do
    touch ["hello.txt", "test.txt", "sim.txt"]
    system bin/"ris", "-select", "*.txt", "-offset", "10", "-keep-name", "."
    assert_path_exists testpath/"0010_hello.txt"
    assert_path_exists testpath/"0020_sim.txt"
    assert_path_exists testpath/"0030_test.txt"
    assert_match version.to_s, shell_output("#{bin}/ris -version")
  end
end
