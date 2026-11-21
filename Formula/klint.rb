# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://klint.dev"
  version "1.9.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.9.0/klint-1.9.0-darwin-arm64.tar.gz"
    sha256 "d2b09b93f5c9525c207617b1885bc969888bceda8e8af41469d0280a3c6bdc9b"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.9.0/klint-1.9.0-darwin-x64.tar.gz"
    sha256 "82c3495e9761f56866b4a338de924f26c1217c45c8d9728c177817482a71d5d2"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.9.0/klint-1.9.0-linux-arm64.tar.gz"
    sha256 "0ecd882a82956031f11a159f06abf9a0192be3349f129611865491683b776119"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.9.0/klint-1.9.0-linux-x64.tar.gz"
    sha256 "4120a62ed4dd5c94d25ddaff6f7fce25e5b46892fb112dfdff685d8ec7f9314c"
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
