require 'activerecord'
require 'ludicrous_speed/named_yield_or'

ActiveRecord::Base.extend( LudicrousSpeed::NamedYieldOr )