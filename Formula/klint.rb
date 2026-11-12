# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.4.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.4.0/klint-1.4.0-darwin-arm64.tar.gz"
    sha256 "05008af79d0634e3b2813310ef133dbe103ff4966a8abb125e5a07423f79f483"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.4.0/klint-1.4.0-darwin-x64.tar.gz"
    sha256 "52c888c92c6fa2a135082d1e75d6c7380b0872f7849ce6edf0cca895de26ae16"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.4.0/klint-1.4.0-linux-arm64.tar.gz"
    sha256 "7f9a8bcb7c5a1f30f4728051ec46a51d645cb9fbca722543c3612d956d18c35d"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.4.0/klint-1.4.0-linux-x64.tar.gz"
    sha256 "e0100b2867bdc3048404ddc539e0bc06af516180b640398364bae36f8b1c4bc4"
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
