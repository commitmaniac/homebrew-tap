class MMicro < Formula
  desc "Modern terminal-based text editor with personal patches"
  homepage "https://micro-editor.github.io"
  url "https://github.com/zyedidia/micro.git",
      tag:      "v2.0.14",
      revision: "04c577049ca898f097cd6a2dae69af0b4d4493e1"
  license "MIT"
  revision 1
  head "https://github.com/zyedidia/micro.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/commitmaniac/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "49ca9a34b7d5c6029ecc7f3e37bdbbab278df209809509fba793fa425ee78fcf"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a0948107c6d679f3d44c9ff90b066cfce8fa0d412f4dfdc36974cb156d76d488"
    sha256 cellar: :any_skip_relocation, ventura:       "0a7a57a8c9d04aa1b39e803d27cc898acb31cbe0096aac8f751fe24d8bf7a8ee"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f62b7bc092195fdcd093d195885c633cfb3ba40215940555926700dc5879c6c8"
  end

  depends_on "go" => :build

  conflicts_with "micro", because: "micro install a conflicting micro binary"

  resource "micro-syntax" do
    url "https://github.com/commitmaniac/micro-syntax/archive/refs/tags/1.1.0.tar.gz"
    sha256 "d5ea23be8cb022f3776f1d21c3838a1f450421a8b55bac1de8b397bbf81db40a"
  end

  patch do
    url "https://gist.github.com/commitmaniac/ce1bfd39705ed265181db82b8bdf76ec/raw/adblock-list-support-comments.patch"
    sha256 "975327728c7bd8f9cfcb37fbdb085113dc845c4f354a8ab3642c7280b4320626"
  end

  def install
    (buildpath/"runtime/syntax/").install resource("micro-syntax")
    system "make", "build-tags"

    bin.install "micro"
    bin.install_symlink "micro" => "editor"
    man1.install "assets/packaging/micro.1"
  end

  test do
    assert_match version.to_s, shell_output(bin/"micro -version")
  end
end
