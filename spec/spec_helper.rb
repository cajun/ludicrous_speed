require 'rubygems'
require 'bacon'
require 'ruby-debug'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ludicrous_speed'

File.delete( 'dbfile' )
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "dbfile")

Bacon.summary_on_exit

ActiveRecord::Migration.create_table :foos do |t|
  t.string  :name
  t.string  :bacon
  t.text  :_why
end

class Foo < ActiveRecord::Base
  named_yield_or( :bar, { :conditions => "_why = 'bacon'" } )
  named_yield_or( :omg, lambda{ |x,y| { :conditions => "#{x} != #{y}" } } )
end