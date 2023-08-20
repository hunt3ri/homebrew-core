require "language/node"

class Marked < Formula
  desc "Markdown parser and compiler built for speed"
  homepage "https://marked.js.org/"
  url "https://registry.npmjs.org/marked/-/marked-7.0.4.tgz"
  sha256 "821eb0a2ff829ffb51b5dd61f8b8a7b18537871619dcd9f5dbab92c8783f46a8"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "d0712f914e759c59600bedc4ca77c8d08ad92272e2bef0c4d6479b320b1ddd14"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "<p>hello <em>world</em></p>", pipe_output("#{bin}/marked", "hello *world*").strip
  end
end
