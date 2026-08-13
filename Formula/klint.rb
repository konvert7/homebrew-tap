# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.2.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/native-v0.2.2/klint-0.2.2-darwin-arm64.tar.gz"
    sha256 "bb1bcd3192aa628da7f52bd30226ca89b1b05d8975fc162d6ffe2dc88c146399"
  else
    url "https://github.com/konvert7/klint/releases/download/native-v0.2.2/klint-0.2.2-darwin-x64.tar.gz"
    sha256 "e61186af32ae4fa4bd23fcd5ab736d0d21a55d0436dff2c5646143886afa0739"
  end

  def install
    binary = File.exist?("klint") ? "klint" : Dir["klint-*/klint"].first
    odie "klint binary not found" unless binary
    bin.install binary => "klint"
  end

  test do
    assert_match "klint-rs", shell_output("#{bin}/klint --version")
  end
end
