# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hijri_gem}
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mohammad El-Abid"]
  s.date = %q{2011-03-26}
  s.description = %q{Adds Hijri support to Ruby}
  s.email = %q{mohammad {dot} elabid {at} gmail}
  s.extra_rdoc_files = ["README.markdown", "README.txt", "lib/hijri_gem.rb"]
  s.files = ["Manifest", "README.markdown", "README.txt", "Rakefile", "hijri_gem.gemspec", "lib/hijri_gem.rb"]
  s.homepage = %q{http://rubygems.org/gems/hijri_gem}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Hijri_gem", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{hijri_gem}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Adds Hijri support to Ruby}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
