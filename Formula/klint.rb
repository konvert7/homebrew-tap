# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://klint.dev"
  version "1.7.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.7.0/klint-1.7.0-darwin-arm64.tar.gz"
    sha256 "145653acbf585cff602d07862944778f69828414c6d669240b7c92f88bb2899d"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.7.0/klint-1.7.0-darwin-x64.tar.gz"
    sha256 "b514403bfa71df3353d2f4c3c405d0a885393828a9e548359f0942baf498c72a"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.7.0/klint-1.7.0-linux-arm64.tar.gz"
    sha256 "86c44df6bdc42031852e61198ba9a45ad2e6d55d1a34a98775d7a74d6c418910"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.7.0/klint-1.7.0-linux-x64.tar.gz"
    sha256 "5be03c2a66897fca9fbed4ed340872b97a5d80f763840e057cc07096760b4215"
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
