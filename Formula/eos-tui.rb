class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.12/eos-tui_v0.2.12_macos_arm64"
      sha256 "aebc64c03567a85ac9098030e3546d89217f168294759bcc3ebdbd46340f8db0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.12/eos-tui_v0.2.12_linux_amd64"
      sha256 "b195e6dbfb696284632c713e05519c1f82e1205aad39507887afb3a460450ef6"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.12/eos-tui_v0.2.12_linux_arm64"
        sha256 "2cee835788266c3203c330e35adae361775f192823b2573d7ddcd05689a4b095"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.12_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.12_linux_arm64"
      else
        "eos-tui_v0.2.12_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
