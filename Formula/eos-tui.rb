class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/lobis/eos-tui"
  url "https://github.com/lobis/eos-tui/archive/refs/tags/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "a3981e1af98fd040361ecfd35594b14922df9bfbbf80da94e5f37c3b83b67bd6"
  license "MIT"
  head "https://github.com/lobis/eos-tui.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/eos-tui --help 2>&1")
  end
end
