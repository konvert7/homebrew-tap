# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.3.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.3.1/klint-1.3.1-darwin-arm64.tar.gz"
    sha256 "94c8a7ab0294f0e1cbf92c6539f8643a1f90a43a3c7772be2eade55897c17d6b"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.3.1/klint-1.3.1-darwin-x64.tar.gz"
    sha256 "a881c19acd473f5c4775da98fb9a6c067976f99967cf0f07cfb3b6b9bb78114f"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.3.1/klint-1.3.1-linux-arm64.tar.gz"
    sha256 "e4e5c41ac57aad4dc301b711262847349febff61c730f9947846b30a133ea4e8"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.3.1/klint-1.3.1-linux-x64.tar.gz"
    sha256 "4b9292fc11e4aecb2af2f43f2db64d6546aa42394e17974578b12ce6b0f849d2"
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
