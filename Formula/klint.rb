# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/konvert7/klint/releases/download/native-v0.1.3/klint-0.1.3-darwin-arm64.tar.gz"
      sha256 "a028bdf1535e1fa3237ff0529c3cbeadf338fc6bbaa27af6abc24eac24d62146"
    end

    on_intel do
      url "https://github.com/konvert7/klint/releases/download/native-v0.1.3/klint-0.1.3-darwin-x64.tar.gz"
      sha256 "b36ad43de716fdba112c995cb709afb8a1dc7fd378ce8693134be166bab4eb08"
    end
  end

  def install
    binary = File.exist?("klint") ? "klint" : Dir["klint-*/klint"].first
    odie "klint binary not found" unless binary
    bin.install binary => "klint"
  end

  test do
    assert_match "klint-rs", shell_output("#{bin}/klint --version")
  end
end
