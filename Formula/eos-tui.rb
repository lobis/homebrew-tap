class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/lobis/eos-tui"
  url "https://github.com/lobis/eos-tui/archive/50485dd4833630647706a4f334d46a56094e0968.tar.gz"
  version "0.0.0"
  sha256 "29e525e18b436a73dd3e42ac5b8669726fb7c296dd84c7df32a6c1b8cb387412"
  license "MIT"
  head "https://github.com/lobis/eos-tui.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/eos-tui --help")
  end
end
