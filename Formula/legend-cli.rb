class LegendCli < Formula
  desc "CLI and MCP server for Legend"
  homepage "https://legend.xyz"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/legend-hq/legend-cli/releases/download/v#{version}/legend-cli-macos-aarch64.tar.gz"
      sha256 "3a8b224e8a1fda268f5e0f21051a9925437e941045336f063ddd77225d2e7197"
    end
  end

  def install
    # Homebrew strips the top-level .app directory from the tarball,
    # so we rebuild it in the prefix.
    app = prefix/"legend-cli.app"
    app.install Dir["*"]
    bin.write_exec_script app/"Contents/MacOS/legend-cli"
  end

  test do
    assert_match "legend-cli", shell_output("#{bin}/legend-cli --help")
  end
end
