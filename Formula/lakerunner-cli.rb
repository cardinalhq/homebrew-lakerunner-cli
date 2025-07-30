class LakerunnerCli < Formula
  desc "The intuitive CLI to query your S3 logs"
  homepage "https://github.com/cardinalhq/lakerunner-cli"
  version "0.0.15"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/cardinalhq/lakerunner-cli/releases/download/v0.0.15/lakerunner-cli_Darwin_x86_64.tar.gz"
      sha256 "59269fb9f607eca7155666754aa8341a4bc9cfbd467a088ee367fb7f0ef1073c"
    else
      url "https://github.com/cardinalhq/lakerunner-cli/releases/download/v0.0.15/lakerunner-cli_Darwin_arm64.tar.gz"
      sha256 "90bbf852183dfc6f3988104fe1a82404063fe6c54290cd293080cac8acfb114d"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/cardinalhq/lakerunner-cli/releases/download/v0.0.15/lakerunner-cli_Linux_x86_64.tar.gz"
      sha256 "229634671c5dc63a95b25ddeb492166d125963761017135382e49a082886c05f"
    else
      url "https://github.com/cardinalhq/lakerunner-cli/releases/download/v0.0.15/lakerunner-cli_Linux_arm64.tar.gz"
      sha256 "6a7ea3e0b6dd3a26ee3dd5242475420f37d41ba9e15f65959a27bc8191009773"
    end
  end

  def install
    # The tarball contains the binary named 'lakerunner-cli'
    bin.install "lakerunner-cli"
  end

  def caveats
    <<~EOS
      To use lakerunner-cli, you need to set up Lakerunner first.

      Set these environment variables:
        export LAKERUNNER_QUERY_URL=http://localhost:7101
        export LAKERUNNER_API_KEY=your-api-key

      For more information, visit: https://cardinalhq.io/
    EOS
  end

  test do
    # Basic sanity test: check the binary executes and prints version/help
    assert_match version.to_s, shell_output("#{bin}/lakerunner-cli --version")
  end
end
