class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.11/eos-tui_v0.2.11_macos_arm64"
      sha256 "71e652b05ca8632a07882c7a9f9a7e2417f76af3e6f5a178f3b2ed968701e513"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.11/eos-tui_v0.2.11_linux_amd64"
      sha256 "c3afcb9000b8f34ad2b0e87420e08f5d675e8b7111ca4f4ec3f999feecc764b2"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.11/eos-tui_v0.2.11_linux_arm64"
        sha256 "556f504659c7420671e0f036f06e1240f98a5c071037f637c25b8157898e1b05"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.11_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.11_linux_arm64"
      else
        "eos-tui_v0.2.11_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
