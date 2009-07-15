require 'rubygems'
require 'activerecord'
require 'spec'
require 'machinist'
require 'faker'

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'pg_migrations'