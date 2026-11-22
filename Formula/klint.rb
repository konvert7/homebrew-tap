# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://klint.dev"
  version "1.13.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.13.1/klint-1.13.1-darwin-arm64.tar.gz"
    sha256 "d1a11cddfefb193f3974c4b886d051e67e052ded98d46525071987d5872fe907"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.13.1/klint-1.13.1-darwin-x64.tar.gz"
    sha256 "36f45600ee07a4966b1e38b5c371228b1ad9dc58fa7c15456e15a4616e4086fd"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.13.1/klint-1.13.1-linux-arm64.tar.gz"
    sha256 "4eb95b48c023b0527e47bb6b495e25ddc66f08e8542ff0cc3ac2e81d28065d4c"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.13.1/klint-1.13.1-linux-x64.tar.gz"
    sha256 "d4bbad00b9644d141301927f27d0b2cea51aeb29a060a97397b8cb31a54f9d91"
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
