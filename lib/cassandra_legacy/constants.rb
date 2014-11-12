
class CassandraLegacy
  # A helper module you can include in your own class. Makes it easier 
  # to work with CassandraLegacy subclasses.
  module Constants
    include CassandraLegacy::Consistency
        
    Long = CassandraLegacy::Long
    OrderedHash = CassandraLegacy::OrderedHash
  end
end
