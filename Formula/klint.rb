# typed: false
# frozen_string_literal: true

class Klint < Formula
  desc "Architecture-as-Code linter: layer boundaries, imports and forbidden patterns"
  homepage "https://klint.dev"
  version "1.8.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.8.0/klint-1.8.0-darwin-arm64.tar.gz"
    sha256 "eaa8d201b8114059b7d1fbb09a4f4431b6196278814a42c5cd23a2143fa83a7b"
  elsif OS.mac?
    url "https://github.com/konvert7/klint/releases/download/v1.8.0/klint-1.8.0-darwin-x64.tar.gz"
    sha256 "3a8d69c09216680f93da6ab8edcfb3cee902a15a4410d73be2a491320ee112af"
  elsif Hardware::CPU.arm?
    url "https://github.com/konvert7/klint/releases/download/v1.8.0/klint-1.8.0-linux-arm64.tar.gz"
    sha256 "d448ef56cc3dcc7cb8e7c59c83117c11e0f917646b9e558d87e0adc7d9d8a090"
  else
    url "https://github.com/konvert7/klint/releases/download/v1.8.0/klint-1.8.0-linux-x64.tar.gz"
    sha256 "24e30ed0a5451e77107c59ab5a7b2f4a75ab6ddad78c349fba1bfa7e9c79dd83"
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
