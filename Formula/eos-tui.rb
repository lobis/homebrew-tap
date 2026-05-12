class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.10/eos-tui_v0.2.10_macos_arm64"
      sha256 "deac637bdfccc78a6b2b25a7565d2d33e6bbf1c0812a82f0125aad86adc9f154"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.10/eos-tui_v0.2.10_linux_amd64"
      sha256 "b24474e313b3445889374037066a13e067b5877dbcfdb66ce8570323bb6d84a2"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.10/eos-tui_v0.2.10_linux_arm64"
        sha256 "2fba2b6f1768b329e795a46e725484db6fe2d3d51408d2c39084938d7250154f"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.10_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.10_linux_arm64"
      else
        "eos-tui_v0.2.10_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
