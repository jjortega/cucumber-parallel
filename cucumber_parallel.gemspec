# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cucumber_parallel/version'

Gem::Specification.new do |spec|
  spec.name          = "cucumber_parallel"
  spec.version       = CucumberParallel::VERSION
  spec.authors       = ["jjortega"]
  spec.email         = ["juanjortcan@gmail.com"]

  spec.summary       = %q{A little tool to run cucumber tests with selenium grid}
  spec.description   = %q{A little tool to run cucumber tests with selenium grid}
  spec.homepage      = "http://www.nothing.com"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "celluloid", "~> 0.17"
  spec.add_development_dependency "cucumber", "~> 2.4"
  spec.add_development_dependency "rubysl-open3", "~> 2.0"
  spec.add_development_dependency "nokogiri", "~> 1.6"
  spec.add_development_dependency "httparty", "~> 0.13"
  spec.add_development_dependency "byebug", "~> 9.0"
end
