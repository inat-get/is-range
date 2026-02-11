# frozen_string_literal: true

require_relative 'lib/is-range/info'

Gem::Specification::new do |spec|
  spec.name     =   IS::Range::Info::NAME
  spec.summary  =   IS::Range::Info::SUMMARY
  spec.version  =   IS::Range::Info::VERSION
  spec.license  =   IS::Range::Info::LICENSE
  spec.authors  = [ IS::Range::Info::AUTHOR ]
  spec.homepage =   IS::Range::Info::HOMEPAGE

  spec.files = Dir[ 'lib/**/*', 'README.md', 'LICENSE', 'coverage-badge.svg' ]

  spec.required_ruby_version = '>= 3.4'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'redcarpet'
  spec.add_development_dependency 'rdoc'
end
