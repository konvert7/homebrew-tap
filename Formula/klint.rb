# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.2.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/native-v0.2.1/klint-0.2.1-darwin-arm64.tar.gz"
    sha256 "4d9279c71fb3f065513cdebf03d9481bccbb0349ddae7516616a55b61fadadce"
  else
    url "https://github.com/konvert7/klint/releases/download/native-v0.2.1/klint-0.2.1-darwin-x64.tar.gz"
    sha256 "a024f8aeb29ab9f9de0a0bf79a68a4955e1c13eb5e481bbd9cd28fe16de95f84"
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
