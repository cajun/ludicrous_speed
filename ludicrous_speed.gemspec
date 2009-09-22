# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ludicrous_speed}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["cajun"]
  s.date = %q{2009-09-22}
  s.email = %q{zac@kleinpeter.org}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/ludicrous_speed.rb",
     "lib/ludicrous_speed/columns.rb",
     "lib/ludicrous_speed/model.rb",
     "lib/ludicrous_speed/named_yield_or.rb",
     "ludicrous_speed.gemspec",
     "spec/ludicrous_speed_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/cajun/ludicrous_speed}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/ludicrous_speed_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
