# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby_textmate}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steven Soroka"]
  s.date = %q{2008-12-14}
  s.description = %q{a ruby interface to textmate}
  s.email = %q{ssoroka78@gmail.com}
  s.extra_rdoc_files = ["lib/ruby_textmate.rb"]
  s.files = ["lib/ruby_textmate.rb", "Manifest", "Rakefile", "ruby_textmate.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/ssoroka/ruby_textmate}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ruby_textmate"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ruby_textmate}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{a ruby interface to textmate}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
