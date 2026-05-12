class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.8/eos-tui_v0.2.8_macos_arm64"
      sha256 "feec6a6ef20b169d0d5c2b5847316cb931162d5d90a86991b82814e6cd8aa0d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.8/eos-tui_v0.2.8_linux_amd64"
      sha256 "90d25661553460980720f87042232321fd56ae884adf6dbf72a2916d2bcc289d"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.8/eos-tui_v0.2.8_linux_arm64"
        sha256 "ec4937916d1e56596ace1cee4aaf5504f2dc11cb9ab8c1a0aedecd810c6bfd2d"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.8_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.8_linux_arm64"
      else
        "eos-tui_v0.2.8_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
