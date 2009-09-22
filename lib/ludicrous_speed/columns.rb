module LudicrousSpeed
  class Columns
    attr_accessor :name, :display, :format
    def initialize(column_name, options={} )
      self.name = column_name.to_sym
      self.display_name = param_to_lambda( options[:display_name], column_name )
      self.format = param_to_lambda( options[:format] )
    end
    
    
    private
    
      def param_to_lambda( param, default=nil )
        lambda do
          case param
            when Proc
              param.call( *args )
            when String, Symbol
              param
            else
              default
          end
        end
      end
  end
end