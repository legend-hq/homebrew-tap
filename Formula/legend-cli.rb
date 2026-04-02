class LegendCli < Formula
  desc "CLI and MCP server for Legend"
  homepage "https://legend.xyz"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/legend-hq/legend-cli/releases/download/v#{version}/legend-cli-macos-aarch64.tar.gz"
      sha256 "ad6b47fc9a61ee827b5067a668e2cc4e23f0bdd4442ecf3f04f893ffe75a3785"
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
