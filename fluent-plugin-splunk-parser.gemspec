lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name    = "fluent-plugin-splunk-parser"
  spec.version = "0.1.1"
  spec.authors = ["Zsolt Fekete"]
  spec.email   = ["zsoltf@me.com"]

  spec.summary       = %q{Fluentd Splunk Parser plugin}
  spec.description   = %q{Fluentd plugin that parsers splunk formatted logs}
  spec.homepage      = "https://github.com/zsoltf/fluent-plugin-splunk-parser"
  spec.license       = "BSD-2-Clause"

  test_files, files  = `git ls-files -z`.split("\x0").partition do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.files         = files
  spec.executables   = files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = test_files
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "test-unit", "~> 3.0"
  spec.add_runtime_dependency "fluentd", [">= 0.14.10", "< 2"]
end
