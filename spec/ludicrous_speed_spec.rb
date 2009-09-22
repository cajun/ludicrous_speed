require 'spec_helper'

describe "LudicrousSpeed" do
  it 'has a really cool finder' do
    Foo.should.respond_to :name_yield_or
  end

  it 'has a really cool named finder' do
    Foo.should.respond_to :bar
  end

  it 'has a really cool finder definitions' do
    Foo.should.respond_to :definitions
  end

  it 'will have bar and it will find _why\'s bacon' do
    Foo.definitions[:bar].call.should == {:conditions => "_why = 'bacon'"}
  end

  it 'has conditions that get scoped' do
    Foo.send( :scoped_methods ).should.be.empty?
    
    Foo.bar do
      Foo.send( :scoped_methods ).should == [ { :find => {:conditions => "_why = 'bacon'"} } ]
      Foo.send( :current_scoped_methods ).should == { :find => {:conditions => "_why = 'bacon'"} }
    end

    Foo.send( :scoped_methods ).should.be.empty?
  end
  
  it 'like params in the name yield or scopes as well' do
    should.not.raise  { Foo.omg( '_why', 1 ) }
  end
  
  
  it 'can do nesting with ease' do
    Foo.send( :scoped_methods ).should.be.empty?
    
    Foo.omg( 'name', 6 ) do
      Foo.send( :scoped_methods ).should == [ { :find => {:conditions => "name != 6"} } ]
      Foo.send( :current_scoped_methods ).should == { :find => {:conditions => "name != 6"} }

      Foo.bar do
        Foo.send( :scoped_methods ).should == [{:find=>{:conditions=>"name != 6"}}, {:find=>{:conditions=>"(name != 6) AND (_why = 'bacon')"}}]
        Foo.send( :current_scoped_methods ).should == {:find=>{:conditions=>"(name != 6) AND (_why = 'bacon')"}}
      end

      Foo.send( :scoped_methods ).should == [ { :find => {:conditions => "name != 6"} } ]
      Foo.send( :current_scoped_methods ).should == { :find => {:conditions => "name != 6"} }
      
    end
  end
end
