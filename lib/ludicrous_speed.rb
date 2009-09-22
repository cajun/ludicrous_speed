require 'activerecord'
require 'ludicrous_speed/named_yield_or'
require 'ludicrous_speed/model'
require 'ludicrous_speed/columns'


ActiveRecord::Base.extend( LudicrousSpeed::NamedYieldOr )
ActiveRecord::Base.extend( LudicrousSpeed::Model )
