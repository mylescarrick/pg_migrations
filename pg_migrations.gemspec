# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pg_migrations}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Myles Carrick"]
  s.date = %q{2009-08-06}
  s.description = %q{Adds migration helpers to allow for postgres-specific stuff like real constraints}
  s.email = ["mylescarrick@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/pg_migrations.rb", "lib/pg_migrations/migrations_helper.rb", "script/console", "script/destroy", "script/generate", "spec/fixtures/blueprints.rb", "spec/fixtures/blueprints_helper.rb", "spec/fixtures/migration_scaffold.rb", "spec/fixtures/models.rb", "spec/pg_migrations_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.homepage = %q{http://github.com/mylescarick/pg_migrations}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pg_migrations}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Adds migration helpers to allow for postgres-specific stuff like real constraints}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.3.2"])
    else
      s.add_dependency(%q<hoe>, [">= 2.3.2"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.3.2"])
  end
end
