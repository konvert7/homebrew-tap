# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.38.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v0.38.0/klint-0.38.0-darwin-arm64.tar.gz"
    sha256 "f18a11c6aba8b36d5ce46fa1f5da8941359967bb6fcdb765c0f91daa75fbd9c4"
  else
    url "https://github.com/konvert7/klint/releases/download/v0.38.0/klint-0.38.0-darwin-x64.tar.gz"
    sha256 "c5243a4e7bb0dacf9203bd5370cc23688e4974d79ce3f9aa6b19cb3ebf511b04"
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
