require File.dirname(__FILE__) + '/spec_helper.rb'

def reload
  load(File.join(File.dirname(__FILE__),'fixtures/migration_scaffold.rb'))
end

describe "setting up for business" do
  it "should have a working Postgres connection" do
    ActiveRecord::Base.connection.should be_an_instance_of(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
  end
end


describe "should properly when using the connection" do
  
  it "should have its methods available when using AR" do
    ActiveRecord::Base.connection.methods.should include("add_foreign_key")
  end

end

describe "playing with foreign keys" do

  before(:each) do
    reload
    @post = create_post_and_comments
  end

  it "should prevent deletion of kids if parents exist" do
    ActiveRecord::Base.connection.add_foreign_key(:comments, :post_id, :posts)
    lambda { @post.destroy }.should raise_error(ActiveRecord::StatementInvalid, /violates foreign key constraint/)  
  end

  it "should should cascade delete when supposed to" do
    ActiveRecord::Base.connection.add_foreign_key(:comments, :post_id, :posts, :cascade_delete => true)
    #lambda { @post.destroy }.should raise_error(ActiveRecord::StatementInvalid, /violates foreign key constraint/)
    post_id = @post.id
    #Need to find_by_post_id for consistency - Post won't exist in a minute
    Comment.find_all_by_post_id(post_id).size.should eql(5)
    @post.destroy
    Comment.find_all_by_post_id(post_id).size.should eql(0)
  end

  it "should add a unique constraint"

  it "should make a field mandatory"

  it "should remove the mandatory condition for a field"

end
