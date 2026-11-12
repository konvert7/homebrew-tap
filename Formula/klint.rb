# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.4.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.4.1/klint-1.4.1-darwin-arm64.tar.gz"
    sha256 "980c792b613e4fb83af0389ec2230e5a74d5be2a8df6bf8044c7341a792e16fc"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.4.1/klint-1.4.1-darwin-x64.tar.gz"
    sha256 "9c30d704982f11b80c7f51a3aec871a42f269e2518e6e3a599e20f8771b51230"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.4.1/klint-1.4.1-linux-arm64.tar.gz"
    sha256 "49930dbdda6388d437d0b36adfc49626d493396e8dae78aec1efb585fe872b46"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.4.1/klint-1.4.1-linux-x64.tar.gz"
    sha256 "9152baa90f02099dc76df4975802d03f96e348affdcb2af2192067f42ddbad90"
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
