# -*- encoding: utf-8 -*-
# stub: d3-rails 5.9.2 ruby lib

Gem::Specification.new do |s|
  s.name = "d3-rails".freeze
  s.version = "5.9.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Markus Fenske".freeze]
  s.date = "2019-05-28"
  s.description = "This gem provides D3 for Rails Asset Pipeline.".freeze
  s.email = ["iblue@gmx.net".freeze]
  s.homepage = "https://github.com/iblue/d3-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "D3 for Rails Asset Pipeline".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.1"])
      s.add_development_dependency(%q<rails>.freeze, [">= 3.1"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 3.1"])
      s.add_dependency(%q<rails>.freeze, [">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.1"])
    s.add_dependency(%q<rails>.freeze, [">= 3.1"])
  end
end
