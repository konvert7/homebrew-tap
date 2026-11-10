# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://github.com/konvert7/klint"
  version "1.0.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.0.2/klint-1.0.2-darwin-arm64.tar.gz"
    sha256 "aa7a7eb7cfe8a4c764d58884585127c0626e41fc066b93cb182a41fb8b5839a8"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.0.2/klint-1.0.2-darwin-x64.tar.gz"
    sha256 "a5eda2ca822f207293f15b8f7fde471d5e1b2caaa919d0d179de99be1ff50759"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.0.2/klint-1.0.2-linux-arm64.tar.gz"
    sha256 "d40960ab91436d364f6437afdbf148e03a932ca5f13376ba34d842e030db8c46"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.0.2/klint-1.0.2-linux-x64.tar.gz"
    sha256 "b8cca8012438f731f3814ba3e15f38203e3d7280c2a5135debddf91eac699ec6"
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
