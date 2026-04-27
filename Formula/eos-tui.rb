class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.4/eos-tui_v0.2.4_macos_arm64"
      sha256 "2d8297f746dbf11a8a5b7a26fa772d7a0ffb5c89b5464f434db7594c164bb21f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.4/eos-tui_v0.2.4_linux_amd64"
      sha256 "5443fdd24a6f48187f5c9ecff80d111804e4b26459b2c98b80b7fba06653d31f"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.4/eos-tui_v0.2.4_linux_arm64"
        sha256 "8a494a2f3b0a84de327df8d65ab9c686127e2626f96582757e9b4e28b45fba25"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.4_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.4_linux_arm64"
      else
        "eos-tui_v0.2.4_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
