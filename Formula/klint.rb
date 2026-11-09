# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.37.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v0.37.0/klint-0.37.0-darwin-arm64.tar.gz"
    sha256 "31cfeebb858d863794cb389f943ab6a500aaf0fa1cf1d4bbf6af4f8f9326585c"
  else
    url "https://github.com/konvert7/klint/releases/download/v0.37.0/klint-0.37.0-darwin-x64.tar.gz"
    sha256 "34c7cef729f545c0ba03446f35c6a4948752922510a0b986486af179f674fe9c"
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
