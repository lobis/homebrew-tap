class EosTui < Formula
  desc "Terminal UI for monitoring and managing EOS storage clusters"
  homepage "https://github.com/cern-eos/eos-tui"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.6/eos-tui_v0.2.6_macos_arm64"
      sha256 "aa0a37eda95dd87ea47ca7198f3a3cd386680161d9fd4b5f2cb324969d37bc41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.6/eos-tui_v0.2.6_linux_amd64"
      sha256 "690222225e2c439db522403ddd146ce5ef0f4da5301078e164995e9149f7f16f"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cern-eos/eos-tui/releases/download/v0.2.6/eos-tui_v0.2.6_linux_arm64"
        sha256 "8e2e4930dcd80b333bdebabfd479c50b0771bf54e1d47320706e22e5203839cf"
      end
    end
  end

  def install
    binary =
      if OS.mac?
        "eos-tui_v0.2.6_macos_arm64"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        "eos-tui_v0.2.6_linux_arm64"
      else
        "eos-tui_v0.2.6_linux_amd64"
      end
    bin.install binary => "eos-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eos-tui --version")
  end
end
