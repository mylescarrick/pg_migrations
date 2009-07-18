require 'rubygems'
require 'activerecord'
require 'spec'
require 'machinist'
require 'machinist/active_record'
require 'faker'
require 'spec/fixtures/models'
require 'spec/fixtures/migration_scaffold'
require 'spec/fixtures/blueprints'
require 'spec/fixtures/blueprints_helper'

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'pg_migrations'

Spec::Runner.configure do |config|
  config.before(:each) { Sham.reset }
end