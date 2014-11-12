require 'rubygems'
gem 'thrift_client', '~> 0.7'
require 'thrift_client'
gem 'simple_uuid' , '~> 0.3'
require 'simple_uuid'

require 'json' unless defined?(JSON)

here = File.expand_path(File.dirname(__FILE__))

class Cassandra ; end
unless Cassandra.respond_to?(:VERSION)
  require "#{here}/cassandra_thrift/0.8"
end

$LOAD_PATH << "#{here}/../vendor/#{Cassandra.VERSION}/gen-rb"
require "#{here}/../vendor/#{Cassandra.VERSION}/gen-rb/cassandra"

$LOAD_PATH << "#{here}"

require 'cassandra_thrift/helpers'
require 'cassandra_thrift/array'
require 'cassandra_thrift/time'
require 'cassandra_thrift/comparable'
require 'cassandra_thrift/long'
require 'cassandra_thrift/composite'
require 'cassandra_thrift/dynamic_composite'
require 'cassandra_thrift/ordered_hash'
require 'cassandra_thrift/columns'
require 'cassandra_thrift/protocol'
require 'cassandra_thrift/batch'
require "cassandra_thrift/#{Cassandra.VERSION}/columns"
require "cassandra_thrift/#{Cassandra.VERSION}/protocol"
require "cassandra_thrift/cassandra"
require "cassandra_thrift/#{Cassandra.VERSION}/cassandra"
unless Cassandra.VERSION.eql?("0.6")
  require "cassandra_thrift/column_family"
  require "cassandra_thrift/keyspace"
end
require 'cassandra_thrift/constants'
require 'cassandra_thrift/debug' if ENV['DEBUG']

begin
  require "cassandra_native"
rescue LoadError
  puts "Unable to load cassandra_native extension. Defaulting to pure Ruby libraries."
end
