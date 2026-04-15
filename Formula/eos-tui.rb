class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/lobis/eos-tui"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lobis/eos-tui/releases/download/v0.1.2/eos-tui_v0.1.2_macos_arm64"
      sha256 "e27a572736d6c763fe551e7cf47c2c7c6261dc60f5013dff60fbb0e2535e311e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lobis/eos-tui/releases/download/v0.1.2/eos-tui_v0.1.2_linux_amd64"
      sha256 "6d555b23847c88624e6512a628b2bd6e7424ec236510d57fd836d6907a1bc2a0"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/lobis/eos-tui/releases/download/v0.1.2/eos-tui_v0.1.2_linux_arm64"
        sha256 "d0f5572b0871bf6bd8ad42c8c615923090e03382026fe6206d984ea5ff4ec5d4"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.1.2_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.1.2_linux_arm64"
      else
        "eos-tui_v0.1.2_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
