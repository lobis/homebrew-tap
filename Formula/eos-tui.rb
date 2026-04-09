class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/lobis/eos-tui"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lobis/eos-tui/releases/download/v0.0.1/eos-tui_v0.0.1_macos_arm64"
      sha256 "4116914e40b730df73e5f5a0d9938117904d4eaab86367badb2beb1650070cfd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lobis/eos-tui/releases/download/v0.0.1/eos-tui_v0.0.1_linux_amd64"
      sha256 "98c3cd4c5efe7fe145fb7427c36feda4a7c9a160a6c82372a91d3b826ab3c5d3"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/lobis/eos-tui/releases/download/v0.0.1/eos-tui_v0.0.1_linux_arm64"
        sha256 "ee4d1a81deedf1e3c0d2c8040543fdcf40d97f64ae690baf124bbc869a389188"
      end
    end
  end

  def install
    binary = "eos-tui_v0.0.1_\#{OS.mac? ? "macos_arm64" : (Hardware::CPU.arm? ? "linux_arm64" : "linux_amd64")}"
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
