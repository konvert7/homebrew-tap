# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://klint.dev"
  version "1.13.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.13.2/klint-1.13.2-darwin-arm64.tar.gz"
    sha256 "4744be477bcb8c0e58222212ee1a11bd895dba8dcd81eb1ec4ca04ea20610a1b"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.13.2/klint-1.13.2-darwin-x64.tar.gz"
    sha256 "4bc160d2de26be9d106cdc037d3b274f734cf5360f96c55bbfb4858aff91225c"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.13.2/klint-1.13.2-linux-arm64.tar.gz"
    sha256 "8c6e52d9c5d5111566fdc5c38843e467d4c91ab6292e276e69d813c2ab849366"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.13.2/klint-1.13.2-linux-x64.tar.gz"
    sha256 "74bd06c09d7f8d64cb741c38bd3e48813404c4f62b7978b443b26d452b4890d4"
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
