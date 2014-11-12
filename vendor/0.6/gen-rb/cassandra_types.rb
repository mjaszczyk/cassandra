#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#


module CassandraThrift
    module ConsistencyLevel
      ZERO = 0
      ONE = 1
      QUORUM = 2
      DCQUORUM = 3
      DCQUORUMSYNC = 4
      ALL = 5
      ANY = 6
      VALUE_MAP = {0 => "ZERO", 1 => "ONE", 2 => "QUORUM", 3 => "DCQUORUM", 4 => "DCQUORUMSYNC", 5 => "ALL", 6 => "ANY"}
      VALID_VALUES = Set.new([ZERO, ONE, QUORUM, DCQUORUM, DCQUORUMSYNC, ALL, ANY]).freeze
    end

    # Basic unit of data within a ColumnFamily.
    # @param name. A column name can act both as structure (a label) or as data (like value). Regardless, the name of the column
    #        is used as a key to its value.
    # @param value. Some data
    # @param timestamp. Used to record when data was sent to be written.
    class Column
      include ::Thrift::Struct, ::Thrift::Struct_Union
      NAME = 1
      VALUE = 2
      TIMESTAMP = 3

      FIELDS = {
        NAME => {:type => ::Thrift::Types::STRING, :name => 'name', :binary => true},
        VALUE => {:type => ::Thrift::Types::STRING, :name => 'value', :binary => true},
        TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'timestamp'}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field name is unset!') unless @name
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field value is unset!') unless @value
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field timestamp is unset!') unless @timestamp
      end

      ::Thrift::Struct.generate_accessors self
    end

    # A named list of columns.
    # @param name. see Column.name.
    # @param columns. A collection of standard Columns.  The columns within a super column are defined in an adhoc manner.
    #                 Columns within a super column do not have to have matching structures (similarly named child columns).
    class SuperColumn
      include ::Thrift::Struct, ::Thrift::Struct_Union
      NAME = 1
      COLUMNS = 2

      FIELDS = {
        NAME => {:type => ::Thrift::Types::STRING, :name => 'name', :binary => true},
        COLUMNS => {:type => ::Thrift::Types::LIST, :name => 'columns', :element => {:type => ::Thrift::Types::STRUCT, :class => CassandraThrift::Column}}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field name is unset!') unless @name
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field columns is unset!') unless @columns
      end

      ::Thrift::Struct.generate_accessors self
    end

    # Methods for fetching rows/records from CassandraLegacy will return either a single instance of ColumnOrSuperColumn or a list
    # of ColumnOrSuperColumns (get_slice()). If you're looking up a SuperColumn (or list of SuperColumns) then the resulting
    # instances of ColumnOrSuperColumn will have the requested SuperColumn in the attribute super_column. For queries resulting
    # in Columns, those values will be in the attribute column. This change was made between 0.3 and 0.4 to standardize on
    # single query methods that may return either a SuperColumn or Column.
    # 
    # @param column. The Column returned by get() or get_slice().
    # @param super_column. The SuperColumn returned by get() or get_slice().
    class ColumnOrSuperColumn
      include ::Thrift::Struct, ::Thrift::Struct_Union
      COLUMN = 1
      SUPER_COLUMN = 2

      FIELDS = {
        COLUMN => {:type => ::Thrift::Types::STRUCT, :name => 'column', :class => CassandraThrift::Column, :optional => true},
        SUPER_COLUMN => {:type => ::Thrift::Types::STRUCT, :name => 'super_column', :class => CassandraThrift::SuperColumn, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    # A specific column was requested that does not exist.
    class NotFoundException < ::Thrift::Exception
      include ::Thrift::Struct, ::Thrift::Struct_Union

      FIELDS = {

      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    # Invalid request could mean keyspace or column family does not exist, required parameters are missing, or a parameter is malformed.
    # why contains an associated error message.
    class InvalidRequestException < ::Thrift::Exception
      include ::Thrift::Struct, ::Thrift::Struct_Union
      def initialize(message=nil)
        super()
        self.why = message
      end

      def message; why end

      WHY = 1

      FIELDS = {
        WHY => {:type => ::Thrift::Types::STRING, :name => 'why'}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field why is unset!') unless @why
      end

      ::Thrift::Struct.generate_accessors self
    end

    # Not all the replicas required could be created and/or read.
    class UnavailableException < ::Thrift::Exception
      include ::Thrift::Struct, ::Thrift::Struct_Union

      FIELDS = {

      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    # RPC timeout was exceeded.  either a node failed mid-operation, or load was too high, or the requested op was too large.
    class TimedOutException < ::Thrift::Exception
      include ::Thrift::Struct, ::Thrift::Struct_Union

      FIELDS = {

      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    # invalid authentication request (user does not exist or credentials invalid)
    class AuthenticationException < ::Thrift::Exception
      include ::Thrift::Struct, ::Thrift::Struct_Union
      def initialize(message=nil)
        super()
        self.why = message
      end

      def message; why end

      WHY = 1

      FIELDS = {
        WHY => {:type => ::Thrift::Types::STRING, :name => 'why'}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field why is unset!') unless @why
      end

      ::Thrift::Struct.generate_accessors self
    end

    # invalid authorization request (user does not have access to keyspace)
    class AuthorizationException < ::Thrift::Exception
      include ::Thrift::Struct, ::Thrift::Struct_Union
      def initialize(message=nil)
        super()
        self.why = message
      end

      def message; why end

      WHY = 1

      FIELDS = {
        WHY => {:type => ::Thrift::Types::STRING, :name => 'why'}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field why is unset!') unless @why
      end

      ::Thrift::Struct.generate_accessors self
    end

    # ColumnParent is used when selecting groups of columns from the same ColumnFamily. In directory structure terms, imagine
    # ColumnParent as ColumnPath + '/../'.
    # 
    # See also <a href="cassandra.html#Struct_ColumnPath">ColumnPath</a>
    class ColumnParent
      include ::Thrift::Struct, ::Thrift::Struct_Union
      COLUMN_FAMILY = 3
      SUPER_COLUMN = 4

      FIELDS = {
        COLUMN_FAMILY => {:type => ::Thrift::Types::STRING, :name => 'column_family'},
        SUPER_COLUMN => {:type => ::Thrift::Types::STRING, :name => 'super_column', :binary => true, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field column_family is unset!') unless @column_family
      end

      ::Thrift::Struct.generate_accessors self
    end

    # The ColumnPath is the path to a single column in CassandraLegacy. It might make sense to think of ColumnPath and
    # ColumnParent in terms of a directory structure.
    # 
    # ColumnPath is used to looking up a single column.
    # 
    # @param column_family. The name of the CF of the column being looked up.
    # @param super_column. The super column name.
    # @param column. The column name.
    class ColumnPath
      include ::Thrift::Struct, ::Thrift::Struct_Union
      COLUMN_FAMILY = 3
      SUPER_COLUMN = 4
      COLUMN = 5

      FIELDS = {
        COLUMN_FAMILY => {:type => ::Thrift::Types::STRING, :name => 'column_family'},
        SUPER_COLUMN => {:type => ::Thrift::Types::STRING, :name => 'super_column', :binary => true, :optional => true},
        COLUMN => {:type => ::Thrift::Types::STRING, :name => 'column', :binary => true, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field column_family is unset!') unless @column_family
      end

      ::Thrift::Struct.generate_accessors self
    end

    # A slice range is a structure that stores basic range, ordering and limit information for a query that will return
    # multiple columns. It could be thought of as CassandraLegacy's version of LIMIT and ORDER BY
    # 
    # @param start. The column name to start the slice with. This attribute is not required, though there is no default value,
    #               and can be safely set to '', i.e., an empty byte array, to start with the first column name. Otherwise, it
    #               must a valid value under the rules of the Comparator defined for the given ColumnFamily.
    # @param finish. The column name to stop the slice at. This attribute is not required, though there is no default value,
    #                and can be safely set to an empty byte array to not stop until 'count' results are seen. Otherwise, it
    #                must also be a value value to the ColumnFamily Comparator.
    # @param reversed. Whether the results should be ordered in reversed order. Similar to ORDER BY blah DESC in SQL.
    # @param count. How many keys to return. Similar to LIMIT 100 in SQL. May be arbitrarily large, but Thrift will
    #               materialize the whole result into memory before returning it to the client, so be aware that you may
    #               be better served by iterating through slices by passing the last value of one call in as the 'start'
    #               of the next instead of increasing 'count' arbitrarily large.
    class SliceRange
      include ::Thrift::Struct, ::Thrift::Struct_Union
      START = 1
      FINISH = 2
      REVERSED = 3
      COUNT = 4

      FIELDS = {
        START => {:type => ::Thrift::Types::STRING, :name => 'start', :binary => true},
        FINISH => {:type => ::Thrift::Types::STRING, :name => 'finish', :binary => true},
        REVERSED => {:type => ::Thrift::Types::BOOL, :name => 'reversed', :default => false},
        COUNT => {:type => ::Thrift::Types::I32, :name => 'count', :default => 100}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field start is unset!') unless @start
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field finish is unset!') unless @finish
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field reversed is unset!') if @reversed.nil?
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field count is unset!') unless @count
      end

      ::Thrift::Struct.generate_accessors self
    end

    # A SlicePredicate is similar to a mathematic predicate (see http://en.wikipedia.org/wiki/Predicate_(mathematical_logic)),
    # which is described as "a property that the elements of a set have in common."
    # 
    # SlicePredicate's in CassandraLegacy are described with either a list of column_names or a SliceRange.  If column_names is
    # specified, slice_range is ignored.
    # 
    # @param column_name. A list of column names to retrieve. This can be used similar to Memcached's "multi-get" feature
    #                     to fetch N known column names. For instance, if you know you wish to fetch columns 'Joe', 'Jack',
    #                     and 'Jim' you can pass those column names as a list to fetch all three at once.
    # @param slice_range. A SliceRange describing how to range, order, and/or limit the slice.
    class SlicePredicate
      include ::Thrift::Struct, ::Thrift::Struct_Union
      COLUMN_NAMES = 1
      SLICE_RANGE = 2

      FIELDS = {
        COLUMN_NAMES => {:type => ::Thrift::Types::LIST, :name => 'column_names', :element => {:type => ::Thrift::Types::STRING, :binary => true}, :optional => true},
        SLICE_RANGE => {:type => ::Thrift::Types::STRUCT, :name => 'slice_range', :class => CassandraThrift::SliceRange, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    # The semantics of start keys and tokens are slightly different.
    # Keys are start-inclusive; tokens are start-exclusive.  Token
    # ranges may also wrap -- that is, the end token may be less
    # than the start one.  Thus, a range from keyX to keyX is a
    # one-element range, but a range from tokenY to tokenY is the
    # full ring.
    class KeyRange
      include ::Thrift::Struct, ::Thrift::Struct_Union
      START_KEY = 1
      END_KEY = 2
      START_TOKEN = 3
      END_TOKEN = 4
      COUNT = 5

      FIELDS = {
        START_KEY => {:type => ::Thrift::Types::STRING, :name => 'start_key', :optional => true},
        END_KEY => {:type => ::Thrift::Types::STRING, :name => 'end_key', :optional => true},
        START_TOKEN => {:type => ::Thrift::Types::STRING, :name => 'start_token', :optional => true},
        END_TOKEN => {:type => ::Thrift::Types::STRING, :name => 'end_token', :optional => true},
        COUNT => {:type => ::Thrift::Types::I32, :name => 'count', :default => 100}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field count is unset!') unless @count
      end

      ::Thrift::Struct.generate_accessors self
    end

    # A KeySlice is key followed by the data it maps to. A collection of KeySlice is returned by the get_range_slice operation.
    # 
    # @param key. a row key
    # @param columns. List of data represented by the key. Typically, the list is pared down to only the columns specified by
    #                 a SlicePredicate.
    class KeySlice
      include ::Thrift::Struct, ::Thrift::Struct_Union
      KEY = 1
      COLUMNS = 2

      FIELDS = {
        KEY => {:type => ::Thrift::Types::STRING, :name => 'key'},
        COLUMNS => {:type => ::Thrift::Types::LIST, :name => 'columns', :element => {:type => ::Thrift::Types::STRUCT, :class => CassandraThrift::ColumnOrSuperColumn}}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field key is unset!') unless @key
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field columns is unset!') unless @columns
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Deletion
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TIMESTAMP = 1
      SUPER_COLUMN = 2
      PREDICATE = 3

      FIELDS = {
        TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'timestamp'},
        SUPER_COLUMN => {:type => ::Thrift::Types::STRING, :name => 'super_column', :binary => true, :optional => true},
        PREDICATE => {:type => ::Thrift::Types::STRUCT, :name => 'predicate', :class => CassandraThrift::SlicePredicate, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field timestamp is unset!') unless @timestamp
      end

      ::Thrift::Struct.generate_accessors self
    end

    # A Mutation is either an insert, represented by filling column_or_supercolumn, or a deletion, represented by filling the deletion attribute.
    # @param column_or_supercolumn. An insert to a column or supercolumn
    # @param deletion. A deletion of a column or supercolumn
    class Mutation
      include ::Thrift::Struct, ::Thrift::Struct_Union
      COLUMN_OR_SUPERCOLUMN = 1
      DELETION = 2

      FIELDS = {
        COLUMN_OR_SUPERCOLUMN => {:type => ::Thrift::Types::STRUCT, :name => 'column_or_supercolumn', :class => CassandraThrift::ColumnOrSuperColumn, :optional => true},
        DELETION => {:type => ::Thrift::Types::STRUCT, :name => 'deletion', :class => CassandraThrift::Deletion, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TokenRange
      include ::Thrift::Struct, ::Thrift::Struct_Union
      START_TOKEN = 1
      END_TOKEN = 2
      ENDPOINTS = 3

      FIELDS = {
        START_TOKEN => {:type => ::Thrift::Types::STRING, :name => 'start_token'},
        END_TOKEN => {:type => ::Thrift::Types::STRING, :name => 'end_token'},
        ENDPOINTS => {:type => ::Thrift::Types::LIST, :name => 'endpoints', :element => {:type => ::Thrift::Types::STRING}}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field start_token is unset!') unless @start_token
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field end_token is unset!') unless @end_token
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field endpoints is unset!') unless @endpoints
      end

      ::Thrift::Struct.generate_accessors self
    end

    # Authentication requests can contain any data, dependent on the AuthenticationBackend used
    class AuthenticationRequest
      include ::Thrift::Struct, ::Thrift::Struct_Union
      CREDENTIALS = 1

      FIELDS = {
        CREDENTIALS => {:type => ::Thrift::Types::MAP, :name => 'credentials', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field credentials is unset!') unless @credentials
      end

      ::Thrift::Struct.generate_accessors self
    end

  end
