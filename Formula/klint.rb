# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.3.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.3.0/klint-1.3.0-darwin-arm64.tar.gz"
    sha256 "e50d143f6ec0fd12f9a941d94366dcd0c04bed2b97fe211edb077d11ea66ae86"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.3.0/klint-1.3.0-darwin-x64.tar.gz"
    sha256 "a26eb074c306f7e5b8165f2aad75bdf85873d72550f1184b5eda53a8d45947b4"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.3.0/klint-1.3.0-linux-arm64.tar.gz"
    sha256 "8a12504a63e400c2be79f5e09158076861c61a68c1c51f035a4753de06c2e0c6"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.3.0/klint-1.3.0-linux-x64.tar.gz"
    sha256 "cd94b5d58f70213e790da562c086535ab772bfc5fb4c5b7e64ed014643ed815e"
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
