class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.7/eos-tui_v0.2.7_macos_arm64"
      sha256 "4e0bbafe83a209affa94d1eae659bb08d8b40098d75dc776e99e2cd17d3ad5eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.7/eos-tui_v0.2.7_linux_amd64"
      sha256 "ea72b25703faea27ed9b20e2d5b66a4ae7b9e069f46c2e8bf9bd5961fd2a2a55"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.7/eos-tui_v0.2.7_linux_arm64"
        sha256 "d1c87597d78bb1367b083ddb54b48ec18f8de598e7ef10bda2407267c8dc9e01"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.7_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.7_linux_arm64"
      else
        "eos-tui_v0.2.7_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
