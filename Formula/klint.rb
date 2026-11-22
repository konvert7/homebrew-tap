# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://klint.dev"
  version "1.12.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.12.0/klint-1.12.0-darwin-arm64.tar.gz"
    sha256 "2999b56a03c82c2eea9f8d9524521401b2d0f9e62d0e79db6016cb240deeab0e"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.12.0/klint-1.12.0-darwin-x64.tar.gz"
    sha256 "e42c618032aabc26eb61ce66e3ba0ebf68091bfcdc0c4f3a4e1d5bb4646e0e5e"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.12.0/klint-1.12.0-linux-arm64.tar.gz"
    sha256 "b02ff95c6ef11ccfbc401211fe994638a4a99760b66a4002f4638401372c0f6b"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.12.0/klint-1.12.0-linux-x64.tar.gz"
    sha256 "13d41657e972870621964e30e4597528321c403c4954fd51eac0efcc43583d88"
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
