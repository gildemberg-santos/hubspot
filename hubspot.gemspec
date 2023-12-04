# frozen_string_literal: true

require_relative "lib/hubspot/version"

Gem::Specification.new do |spec|
  spec.name = "hubspot"
  spec.version = Hubspot::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["gildemberg-santos"]
  spec.email = ["gildemberg.santos@gmail.com"]
  spec.summary = "HubSpot Ruby API Gem"
  spec.description = "HubSpot Ruby API client"
  spec.homepage = "http://github.com/gildemberg-santos/hubspot"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.10"

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

  spec.add_dependency "httparty", "~> 0.21.0"
  spec.add_dependency "u-case", "~> 4.5.2"

  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.58"
  spec.add_development_dependency "pry", "~> 0.14.2"
  spec.add_development_dependency "webmock", "~> 3.19.1"
  spec.add_development_dependency "solargraph", "~> 0.49.0"
end
