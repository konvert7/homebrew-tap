# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.2.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/native-v0.2.0/klint-0.2.0-darwin-arm64.tar.gz"
    sha256 "e24cba1ae1a9c8c91dfd4d36e801da25feba4ac5b83ad70820206c2b448d47d4"
  else
    url "https://github.com/konvert7/klint/releases/download/native-v0.2.0/klint-0.2.0-darwin-x64.tar.gz"
    sha256 "91020a782ca575880351240cb83ad0b9d3cc76e890a0dc8d90987cfaba5a8401"
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
