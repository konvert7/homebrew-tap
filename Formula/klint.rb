# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.5.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.5.3/klint-1.5.3-darwin-arm64.tar.gz"
    sha256 "bf9e63e5d5d6c1fbd0f671864d7a61c6fe5480459dc570bbdca457c174bf8348"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.5.3/klint-1.5.3-darwin-x64.tar.gz"
    sha256 "179050dc9553326dfc01b2c7fed63a7393d5db94fc591b129793f552c4f43779"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.5.3/klint-1.5.3-linux-arm64.tar.gz"
    sha256 "d7950421011251a9fbe5cbeec41edc51c16db80f303bffec6b7f982a82f3cebb"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.5.3/klint-1.5.3-linux-x64.tar.gz"
    sha256 "5b966a8d41f57e2cc8d1604aea5610128a82d34bdb240e1ca31405fcc67a7875"
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
