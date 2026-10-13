# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.35.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v0.35.2/klint-0.35.2-darwin-arm64.tar.gz"
    sha256 "4e0546c6f74080f945753a24bd7415d5c06b823006503e1051a2743853dd58ae"
  else
    url "https://github.com/konvert7/klint/releases/download/v0.35.2/klint-0.35.2-darwin-x64.tar.gz"
    sha256 "2b83c496a250d435d3b393138413d783aa2bbe3f512d220fa567a64dfc785e7e"
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
