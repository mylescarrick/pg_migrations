require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require 'activerecord'
require './lib/pg_migrations'

Hoe.plugin :newgem
# Hoe.plugin :website
# Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'pg_migrations' do
  self.developer 'Myles Carrick', 'mylescarrick@gmail.com'
  self.post_install_message = 'PostInstall.txt'
  self.rubyforge_name       = self.name
  self.version = PgMigrations::GEM_VERSION
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

