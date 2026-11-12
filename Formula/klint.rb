# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.6.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.6.0/klint-1.6.0-darwin-arm64.tar.gz"
    sha256 "66d50f9f113d3b54060e87f9d9b38a5be6756db78d25c517a5125a842ffc82c7"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.6.0/klint-1.6.0-darwin-x64.tar.gz"
    sha256 "a18629c65c0d6e8e3f89e21b52a5a770f69eaf4c5720b8175e873c6f0d1d70dd"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.6.0/klint-1.6.0-linux-arm64.tar.gz"
    sha256 "a9d67038cfac4e72890c1f0e8c8140533e379e5c8127c2cb4b12cc86e20a1f6b"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.6.0/klint-1.6.0-linux-x64.tar.gz"
    sha256 "13fdead70b4b9e3a710f44de62419e11e27615d48eeb61752a8bc223e5dbcbfc"
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
