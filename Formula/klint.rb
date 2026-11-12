# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.2.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.2.0/klint-1.2.0-darwin-arm64.tar.gz"
    sha256 "a10f75ca8cad2604b5f97d24af040828f93e16f5c2edd792aec16e8ab42da1a4"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.2.0/klint-1.2.0-darwin-x64.tar.gz"
    sha256 "cf0322b13131f93ac66ed0188874b319c5815875366331786af30dc34ed78417"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.2.0/klint-1.2.0-linux-arm64.tar.gz"
    sha256 "74a39373ced77ceadf3171f88d4417dbc7c3a324a0a2042a0a0b02f0502892f8"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.2.0/klint-1.2.0-linux-x64.tar.gz"
    sha256 "c8bd186ba89b976891909519423cbc4ad7dccb45abce1fcd52831d1566d87e86"
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
