class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/lobis/eos-tui"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lobis/eos-tui/releases/download/v0.1.1/eos-tui_v0.1.1_macos_arm64"
      sha256 "d676d3c19f9b162760f414e38838bcb58b00a1b4bb4e772eb1afe16faf113dd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lobis/eos-tui/releases/download/v0.1.1/eos-tui_v0.1.1_linux_amd64"
      sha256 "105e0716e23b4b3d381660761a64c4dab3de307371c05e3c0780d2b2c9a54dd5"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/lobis/eos-tui/releases/download/v0.1.1/eos-tui_v0.1.1_linux_arm64"
        sha256 "219b50d33e13faa9be655e7a66f47079ed5e217ff7bef5f8ba41ead78c8d543f"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.1.1_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.1.1_linux_arm64"
      else
        "eos-tui_v0.1.1_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
