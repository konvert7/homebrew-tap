# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.37.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v0.37.1/klint-0.37.1-darwin-arm64.tar.gz"
    sha256 "e0f33e7a6e080695e0b690d514a1fe25505a4def285e26ecb9bf8d0d7fc0f65d"
  else
    url "https://github.com/konvert7/klint/releases/download/v0.37.1/klint-0.37.1-darwin-x64.tar.gz"
    sha256 "50d0b4d611bb98db3eed3a67fde72063830fbd456bf9e04a802d321c45b36497"
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
