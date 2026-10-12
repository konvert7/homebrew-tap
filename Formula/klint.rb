# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.35.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v0.35.0/klint-0.35.0-darwin-arm64.tar.gz"
    sha256 "a2178151e4bdbd103c4b7877c583bff6ef478b73262bd850d23f715bb961956c"
  else
    url "https://github.com/konvert7/klint/releases/download/v0.35.0/klint-0.35.0-darwin-x64.tar.gz"
    sha256 "9d153a0316ead8415b8d3b3e25586250d823ea4f786ea00fc184e7b7bfb7bb93"
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
