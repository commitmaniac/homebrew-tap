class MMicro < Formula
  desc "Modern terminal-based text editor with personal patches"
  homepage "https://micro-editor.github.io"
  url "https://github.com/zyedidia/micro.git",
      tag:      "v2.0.14",
      revision: "04c577049ca898f097cd6a2dae69af0b4d4493e1"
  license "MIT"
  head "https://github.com/zyedidia/micro.git", branch: "master"

  depends_on "go" => :build

  conflicts_with "micro", because: "micro install a conflicting micro binary"

  resource "micro-syntax" do
    url "https://github.com/commitmaniac/micro-syntax/archive/refs/tags/1.0.0.tar.gz"
    sha256 "d5a896005bbda14fbd10f1815cebdbad68d0041e1e02f703fa4e4823078751f2"
  end

  patch do
    url "https://gist.github.com/commitmaniac/ce1bfd39705ed265181db82b8bdf76ec/raw/support-ublock-in-comment-plugin.patch"
    sha256 "38c46923288d1edf5f893429c0841e3e71e009cfda79e0cf80a7ab3b6dd9f3d5"
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
