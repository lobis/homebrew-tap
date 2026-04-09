class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/lobis/eos-tui"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lobis/eos-tui/releases/download/v0.0.2/eos-tui_v0.0.2_macos_arm64"
      sha256 "2eece4ccea66ba04f1c425124bd0a7895d12e7f5cc7710da002ffab78475b365"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lobis/eos-tui/releases/download/v0.0.2/eos-tui_v0.0.2_linux_amd64"
      sha256 "bcdc26deafc126f52cbbaeb8ae14c6fb5ce139223e84d37980b5dd10ea691215"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/lobis/eos-tui/releases/download/v0.0.2/eos-tui_v0.0.2_linux_arm64"
        sha256 "0d7ba458c2ebadbf7830699260b233aa4ebd401d4d0c27e004f68763e4aaf842"
      end
    end
  end

  def install
    binary = "eos-tui_v0.0.2_\#{OS.mac? ? "macos_arm64" : (Hardware::CPU.arm? ? "linux_arm64" : "linux_amd64")}"
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
