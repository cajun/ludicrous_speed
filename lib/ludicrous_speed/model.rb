module LudicrousSpeed
  module Model
    attr_accessor :reporting_name, :ludicrous_columns
    def ludicrous_name( name )
      self.reporting_name = name
    end
    
    def reporting_name
      @reporting_name || name
    end
  end
end