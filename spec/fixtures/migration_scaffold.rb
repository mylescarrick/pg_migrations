# Get an AR connection setup - create a DB and set this to something that's gonna work
# createuser tester -P
# createdb -O tester -E UTF8 pg_migrations_test
# Kinda sucks requiring you to set this up manually for tests... but we're testing a real database
# and of course this isn't gonna work in sqlite
ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :database => "pg_migrations_test",
  :username => "tester",
  :password => "tester"
)

# and now the basic migrations - plain vanilla AR
ActiveRecord::Schema.define do
  self.verbose = false

  create_table :comments, :force => true do |t|
    t.text :body
    t.integer :post_id, :null => false

    t.timestamps
  end
  create_table :posts, :force => true do |t|
    t.string :title
    t.text :body

    t.timestamps
  end
end
