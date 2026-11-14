# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://klint.dev"
  version "1.7.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.7.1/klint-1.7.1-darwin-arm64.tar.gz"
    sha256 "0e209b942f18e10838c936ea7e0eacb6258ce91567bd5de36bda14053294fdff"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.7.1/klint-1.7.1-darwin-x64.tar.gz"
    sha256 "e4883114262a2d736a2650ced8e9f04cf2fb2378c2fbee15b685ce969dffc774"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.7.1/klint-1.7.1-linux-arm64.tar.gz"
    sha256 "c4e37a23b0a1a9b293171107e885da30fad3cab20ca64a3e4728cb2f05e17bd6"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.7.1/klint-1.7.1-linux-x64.tar.gz"
    sha256 "cc3ed442db2b878617c67cade7ac661f1ff8b83c8449e57f85928f9ed6ff17c4"
  end

  def install
    binary = File.exist?("klint") ? "klint" : Dir["klint-*/klint"].first
    odie "klint binary not found" unless binary
    bin.install binary => "klint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/klint --version")
  end
end
