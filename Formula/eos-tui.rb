class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/lobis/eos-tui"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lobis/eos-tui/releases/download/v0.2.0/eos-tui_v0.2.0_macos_arm64"
      sha256 "e179ba5de092eecb978a8b7937616159cf3a39c36800b0c539403f627fd4ff2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lobis/eos-tui/releases/download/v0.2.0/eos-tui_v0.2.0_linux_amd64"
      sha256 "7fc0de7144ad3ee1f4f6ba093a5db97b376f4fdd34f79fea38994bf3917ec257"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/lobis/eos-tui/releases/download/v0.2.0/eos-tui_v0.2.0_linux_arm64"
        sha256 "8ad46108eedbf8a9da32631f2fb9ef78ffa705b15baead6d54f550fa8c30b425"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.0_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.0_linux_arm64"
      else
        "eos-tui_v0.2.0_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
