class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.1/eos-tui_v0.2.1_macos_arm64"
      sha256 "b2a4d6165984afd589840a808f87c7e17ff66b140a0383cab023ca78eb02b0da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.1/eos-tui_v0.2.1_linux_amd64"
      sha256 "1f8c81177b67dfa68771989ed11e6f29b643af0ba20ad6b97dfaddb335340f89"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.1/eos-tui_v0.2.1_linux_arm64"
        sha256 "7a32dfa3107fb6eb346de0a8107ac0d02538685edd7134b94262192035bd012d"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.1_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.1_linux_arm64"
      else
        "eos-tui_v0.2.1_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
