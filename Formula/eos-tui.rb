class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.5/eos-tui_v0.2.5_macos_arm64"
      sha256 "c6f1398afe972ecf07ebaf192c0ddc9f3110d0b56d8daa5101a040c382b57bf3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.5/eos-tui_v0.2.5_linux_amd64"
      sha256 "8f95787aa9867adc1ec3ac9f23d4fd1dc9403b75bfec7c72ae3a19cb185938a4"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.5/eos-tui_v0.2.5_linux_arm64"
        sha256 "fa7c83e8cc3a1f035dfb97ae2c54e1ba09cf17501873d22b32495e7f69db33d3"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.5_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.5_linux_arm64"
      else
        "eos-tui_v0.2.5_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
