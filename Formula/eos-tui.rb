class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.3/eos-tui_v0.2.3_macos_arm64"
      sha256 "1d4a449cb0514dc786f02f3eb07d17d758aef51bc562e7cf0e7d5ff76eba115c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.3/eos-tui_v0.2.3_linux_amd64"
      sha256 "5e55ec32e8eb69010d3f58049b4f4d94155d1fe48d16adb40ec6a2a3afa4080f"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.3/eos-tui_v0.2.3_linux_arm64"
        sha256 "0cec875ce33061bda7bc1da833c15fd68c4e36bd859e926bb5a563c6ea18ceb2"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.3_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.3_linux_arm64"
      else
        "eos-tui_v0.2.3_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
