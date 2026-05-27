# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.1.4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/native-v0.1.4/klint-0.1.4-darwin-arm64.tar.gz"
    sha256 "4420aa4c5a749bcb01045e07e472fa2ed07b5de1e15c0daea5a72dd4f582e458"
  else
    url "https://github.com/konvert7/klint/releases/download/native-v0.1.4/klint-0.1.4-darwin-x64.tar.gz"
    sha256 "c00a85726f46faa5599cf6ab5a1f6a3d5fa2cf15abc1258f1236c362319f1193"
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
