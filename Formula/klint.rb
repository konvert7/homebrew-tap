# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.5.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.5.0/klint-1.5.0-darwin-arm64.tar.gz"
    sha256 "5569ebe92671e3146e0351d44b92731bdc5483ad75fffd2d3804e38e242aa100"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.5.0/klint-1.5.0-darwin-x64.tar.gz"
    sha256 "1cf9b12bd6ede3fb82a417ac0937fa7ec717c0502ac760569d8a6d5c32ee7bdf"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.5.0/klint-1.5.0-linux-arm64.tar.gz"
    sha256 "12863eb8a064341ab0b141c5ae6e9a2d816e9e57c8f6926dda96c5ef9c1cfb45"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.5.0/klint-1.5.0-linux-x64.tar.gz"
    sha256 "300431b849cba18d9ac4493a24975a0bae9dd8e4ce52d74ded61d25395eb5bcd"
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
