require 'rubygems'
gem 'thrift_client', '~> 0.7'
require 'thrift_client'
gem 'simple_uuid' , '~> 0.3'
require 'simple_uuid'

require 'json' unless defined?(JSON)

here = File.expand_path(File.dirname(__FILE__))

class CassandraLegacy ; end
unless CassandraLegacy.respond_to?(:VERSION)
  require "#{here}/cassandra_legacy/0.8"
end

$LOAD_PATH << "#{here}/../vendor/#{CassandraLegacy.VERSION}/gen-rb"
require "#{here}/../vendor/#{CassandraLegacy.VERSION}/gen-rb/cassandra_legacy"

$LOAD_PATH << "#{here}"

require 'cassandra_legacy/helpers'
require 'cassandra_legacy/array'
require 'cassandra_legacy/time'
require 'cassandra_legacy/comparable'
require 'cassandra_legacy/long'
require 'cassandra_legacy/composite'
require 'cassandra_legacy/dynamic_composite'
require 'cassandra_legacy/ordered_hash'
require 'cassandra_legacy/columns'
require 'cassandra_legacy/protocol'
require 'cassandra_legacy/batch'
require "cassandra_legacy/#{CassandraLegacy.VERSION}/columns"
require "cassandra_legacy/#{CassandraLegacy.VERSION}/protocol"
require "cassandra_legacy/cassandra_legacy"
require "cassandra_legacy/#{CassandraLegacy.VERSION}/cassandra_legacy"
unless CassandraLegacy.VERSION.eql?("0.6")
  require "cassandra_legacy/column_family"
  require "cassandra_legacy/keyspace"
end
require 'cassandra_legacy/constants'
require 'cassandra_legacy/debug' if ENV['DEBUG']

begin
  require "cassandra_native"
rescue LoadError
  puts "Unable to load cassandra_native extension. Defaulting to pure Ruby libraries."
end
