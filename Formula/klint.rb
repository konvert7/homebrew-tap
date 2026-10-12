# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.35.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v0.35.1/klint-0.35.1-darwin-arm64.tar.gz"
    sha256 "d54dc0634b91a9cc39c2b41aee2de44c40fb00db01663bf2f6318aa9264457e8"
  else
    url "https://github.com/konvert7/klint/releases/download/v0.35.1/klint-0.35.1-darwin-x64.tar.gz"
    sha256 "a08e6b4cd7f4626fdadbd387ee3954e6a09f5ac7387544621c550021015503f7"
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
