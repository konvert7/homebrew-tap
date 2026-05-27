# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter for TypeScript, Python, and Swift projects"
  homepage "https://github.com/konvert7/klint"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/konvert7/klint/releases/download/native-v0.1.2/klint-0.1.2-darwin-arm64.tar.gz"
      sha256 "c260dca3f526fb9615989fdb7c310a96bc763c98c228ed435836ead0da2aa3b4"
    end

    on_intel do
      url "https://github.com/konvert7/klint/releases/download/native-v0.1.2/klint-0.1.2-darwin-x64.tar.gz"
      sha256 "696dea84d2b72b460af83e726b2b4de8f215d2bffb8e6aff0965e09b394e1a72"
    end
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
