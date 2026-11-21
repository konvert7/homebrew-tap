# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://klint.dev"
  version "1.11.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.11.0/klint-1.11.0-darwin-arm64.tar.gz"
    sha256 "e4fade6a8d7ad98fe22d4c9ff89eaf6df25680361430004c58ef134dcb3a7873"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.11.0/klint-1.11.0-darwin-x64.tar.gz"
    sha256 "9d74c2181c31264eb0d619db4c1d777948b2be26c85787e6c1381a3f0f6aefee"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.11.0/klint-1.11.0-linux-arm64.tar.gz"
    sha256 "15b13cd871de53891302c73f3ee74756e904ccb0443433e64d7a71db8c01554b"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.11.0/klint-1.11.0-linux-x64.tar.gz"
    sha256 "99325a636351f4c2d0aa35673442000b1e1af06126bc6a63a187712a0620bef5"
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
