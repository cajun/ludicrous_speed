module LudicrousSpeed
  module NamedYieldOr
    attr_accessor :definitions
    def named_yield_or( method_name, options )
      method_name = method_name.to_sym
      self.definitions ||= {}
      self.definitions[method_name] = lambda do |*args|
        case options
        when Hash
          options
        when Proc
          options.call( *args )
        else
          raise Exception.new( "Only a Hash or Proc is allowed not a #{options.class}" )
        end
      end
      
      eval( "
        def self.#{method_name}( *args )
          result = nil
          self.with_scope( :find => self.definitions[:#{method_name}].call( *args ) ) do
            result = block_given? ? yield : find( :all )
          end
          result
        end"
      )
    end
  end
end
