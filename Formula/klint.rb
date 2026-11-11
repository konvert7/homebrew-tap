# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.1.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.1.0/klint-1.1.0-darwin-arm64.tar.gz"
    sha256 "829b88aeaae89e4bf3f99e54dcd12ceec950ac992212e58ccd5d5ddf353163d4"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.1.0/klint-1.1.0-darwin-x64.tar.gz"
    sha256 "08f85c1ca95a985383d4fb829708ade2b48f5b930eee82566df399e34269d0e4"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.1.0/klint-1.1.0-linux-arm64.tar.gz"
    sha256 "7209e824407a036a9e5bf413d1d5a2a0446e54c82c19bc2e941e716b8b736099"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.1.0/klint-1.1.0-linux-x64.tar.gz"
    sha256 "1e7f35fc75d54154ddacb918e83274da19f95ebb8826fbb9c7fd2e5bb95d5f75"
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
