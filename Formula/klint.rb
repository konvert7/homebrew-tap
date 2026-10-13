# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.36.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v0.36.0/klint-0.36.0-darwin-arm64.tar.gz"
    sha256 "6dd33d41f4a90da846710c0f7b7ac687a2b27377bef6b6126dc798acce7f2e51"
  else
    url "https://github.com/konvert7/klint/releases/download/v0.36.0/klint-0.36.0-darwin-x64.tar.gz"
    sha256 "825c20cea13c6860956f71a35a9f43058b92ea5db9f30168966e441b83446271"
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
