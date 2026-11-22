# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://klint.dev"
  version "1.13.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.13.0/klint-1.13.0-darwin-arm64.tar.gz"
    sha256 "7de16287e7956d00c9663141fe9784648a495e63022de12321f3ac0244499f80"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.13.0/klint-1.13.0-darwin-x64.tar.gz"
    sha256 "ce444122adc8f633a6b0c29c0e28c9e7f498b235c1ff72154bde59166bd6b75a"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.13.0/klint-1.13.0-linux-arm64.tar.gz"
    sha256 "0c490948498854d7c872757e10f01628e53623d1b686c421720d474510577772"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.13.0/klint-1.13.0-linux-x64.tar.gz"
    sha256 "b0f166339b6bb74b2cdec21062e8f236d3a0a039abc8af09455859ff433c5c26"
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
