# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.5.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.5.2/klint-1.5.2-darwin-arm64.tar.gz"
    sha256 "2d72ddad4066f7caf74e58113402536563ef57968558f408c8b6eddfad22273d"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.5.2/klint-1.5.2-darwin-x64.tar.gz"
    sha256 "a0f45d8c4fab57b16c912cd6de68b3d1a6c3b3be75bca88461714e2d171c5d03"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.5.2/klint-1.5.2-linux-arm64.tar.gz"
    sha256 "019e917a9e2f956267fb170be2a54877ca1e2db8579173b29e2b851f2672a724"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.5.2/klint-1.5.2-linux-x64.tar.gz"
    sha256 "577c425645bf8e3ac83edda10d8f43fd0400482ccb2baf6830fcd64050da1dcc"
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
