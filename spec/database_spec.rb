require 'database'

RSpec.describe Database do
  before(:each) do
    @database = Database.new('willcurry')
  end

  after(:each) do
    @database.close_connection
  end

  it "connects successfully" do
    expect(@database.connect).to eq("Connected")
  end

  it "gets correct results from database" do
    @database.connect
    result = @database.query('SELECT * FROM test;')
    expect(result.first["name"]).to eq("Will")
  end
end
