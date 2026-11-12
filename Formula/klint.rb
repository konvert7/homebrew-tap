# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.5.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.5.1/klint-1.5.1-darwin-arm64.tar.gz"
    sha256 "82c7c4c1d9e87f5c8094c5e7316479e659290a5806d54202e6ca810fff81a2e9"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.5.1/klint-1.5.1-darwin-x64.tar.gz"
    sha256 "ede24c6453eb7c61c9e6452398770d0769afef2eac334050b885cc99fe23f289"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.5.1/klint-1.5.1-linux-arm64.tar.gz"
    sha256 "a06effd279ed2693388601defdc9365447520ab378f8e0315b7d05404a95ba52"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.5.1/klint-1.5.1-linux-x64.tar.gz"
    sha256 "5871bf3ff0dde0970a7db99d59dae1c753f4baad0ce8158be3c60c224fe535bd"
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
