# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://klint.dev"
  version "1.10.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.10.0/klint-1.10.0-darwin-arm64.tar.gz"
    sha256 "2e7789af3ef72b4affcb6a256683aad456f24d06ee234eed232d955080224f47"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.10.0/klint-1.10.0-darwin-x64.tar.gz"
    sha256 "d5b6e4cddd7b428f22073a748e14fd30ac25bd30c0113cd2780ee3165b355ae1"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.10.0/klint-1.10.0-linux-arm64.tar.gz"
    sha256 "519619fad2621b2de87d928a2943c6f565f94551b89ad1cb0ac50cb5a15aef5e"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.10.0/klint-1.10.0-linux-x64.tar.gz"
    sha256 "0fa332fdfc9e7b398e77c6290624412989c3ce506eae0c2c85f2d931953badb7"
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
