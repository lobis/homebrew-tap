class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/lobis/eos-tui"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lobis/eos-tui/releases/download/v0.1.0/eos-tui_v0.1.0_macos_arm64"
      sha256 "c013cd075a9a6f58eb28416c9f83ff5bbaf7bafa6ed627c9b0091cfbf7688ab9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lobis/eos-tui/releases/download/v0.1.0/eos-tui_v0.1.0_linux_amd64"
      sha256 "8febf43666fd70bb95eee123e0a66e0c4554b843ffa6ed8fbb9d3d8557508006"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/lobis/eos-tui/releases/download/v0.1.0/eos-tui_v0.1.0_linux_arm64"
        sha256 "3a6bc38c5915656c4f98f4f9fc1daaf671d389a64c84e2ac01348377d2db5bb3"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.1.0_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.1.0_linux_arm64"
      else
        "eos-tui_v0.1.0_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
