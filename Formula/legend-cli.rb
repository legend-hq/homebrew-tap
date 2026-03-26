class LegendCli < Formula
  desc "CLI and MCP server for Legend"
  homepage "https://legend.xyz"
  license "MIT"
  version "0.0.2"

  on_macos do
    on_arm do
      url "https://github.com/legend-hq/legend-cli/releases/download/v#{version}/legend-cli-macos-aarch64.tar.gz"
      sha256 "cc31068e1ae6c1bb8a69419cd9fdc5adf34d3dfe066b504733e31cda80e91427"
    end
  end

  def install
    prefix.install "legend-cli.app"
    bin.write_exec_script prefix/"legend-cli.app/Contents/MacOS/legend-cli"
  end

  test do
    assert_match "legend-cli", shell_output("#{bin}/legend-cli --help")
  end
end
