class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.2/eos-tui_v0.2.2_macos_arm64"
      sha256 "499898f8befd27481bf5742ba1cc82dda59b32d920d07a2baf9d4fde40f7674a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.2/eos-tui_v0.2.2_linux_amd64"
      sha256 "c9b32f56d7960476b441745695dbd22238995ba4080a3956c0f80009653a3c60"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.2/eos-tui_v0.2.2_linux_arm64"
        sha256 "4f08c8fa674066bed3ddc93da69041d20d3cff145418f73893e12989bcdfdbc1"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.2_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.2_linux_arm64"
      else
        "eos-tui_v0.2.2_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
