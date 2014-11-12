
require 'pp'

class CassandraThrift::CassandraLegacy::Client
  def send_message(*args)
    pp args
    super
  end
end
