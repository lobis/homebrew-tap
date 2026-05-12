class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.9/eos-tui_v0.2.9_macos_arm64"
      sha256 "949f00db35b52fc640c4dd8f1a02c98695f12183bf84885b2f231c56690429db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.9/eos-tui_v0.2.9_linux_amd64"
      sha256 "98556ad0d78614e15c85549c56057cc18a3c10056b0b80726616a5bfbcd70341"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.9/eos-tui_v0.2.9_linux_arm64"
        sha256 "89b00e45f0091bc05455d5695d9b84d0bb9e00151a3b91c43134b6522b0a2fe2"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.9_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.9_linux_arm64"
      else
        "eos-tui_v0.2.9_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
