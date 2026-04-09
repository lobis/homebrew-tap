class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/lobis/eos-tui"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lobis/eos-tui/releases/download/v0.0.3/eos-tui_v0.0.3_macos_arm64"
      sha256 "578623c285149a73b300459943ca31e469e721cb4ff592b377a1e8bc29c272cd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lobis/eos-tui/releases/download/v0.0.3/eos-tui_v0.0.3_linux_amd64"
      sha256 "ea5f4d7c315bbfe443a1487dc39a52f05aad6259cbaafee8c7bbe87e1aadabf4"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/lobis/eos-tui/releases/download/v0.0.3/eos-tui_v0.0.3_linux_arm64"
        sha256 "5d901e6b9c94c6697f64ef357a202024463243fb31f6896e18d892729d4d0914"
      end
    end
  end

  def install
    binary = "eos-tui_v0.0.3_\#{OS.mac? ? "macos_arm64" : (Hardware::CPU.arm? ? "linux_arm64" : "linux_amd64")}"
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
