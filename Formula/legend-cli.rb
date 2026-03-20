class LegendCli < Formula
  desc "CLI for Legend Prime"
  homepage "https://legend.xyz"
  license "MIT"
  version "0.1.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked",
           "--root", prefix,
           "legend-cli",
           "--version", version.to_s
  end

  test do
    assert_match "legend-cli", shell_output("#{bin}/legend-cli --version")
  end
end
