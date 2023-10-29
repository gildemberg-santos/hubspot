# frozen_string_literal: true

require_relative "lib/hubspot/version"

Gem::Specification.new do |spec|
  spec.name = "hubspot"
  spec.version = Hubspot::VERSION
  spec.authors = ["gildemberg-santos"]
  spec.email = ["gildemberg.santos@gmail.com"]
  spec.summary = "Write a short summary, because RubyGems requires one."
  spec.description = "Write a longer description or delete this line."
  spec.homepage = "http://github.com/gildemberg-santos/hubspot"
  spec.license = "MIT"
  spec.required_ruby_version = [">= 2.6.10", "< 3.1.0"]
  spec.metadata["allowed_push_host"] = ""
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/gildemberg-santos/hubspot"
  spec.metadata["changelog_uri"] = "http://github.com/gildemberg-santos/hubspot"
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
