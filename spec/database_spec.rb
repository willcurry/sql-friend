require 'database'

RSpec.describe Database do
  before(:each) do
    @database = Database.new('willcurry')
  end

  it "connects successfully" do
    expect(@database.connect).to eq("Connected")
  end

  it "lets us know if it did not connect" do
    invalid_database = Database.new('invalid_name_of_database')
    expect(invalid_database.connect).to eq('Failed to connect')
  end

  it "gets correct results from database" do
    result = @database.query('SELECT * FROM test;')
    expect(result.first["name"]).to eq("Will")
  end

  it "lets us know if there was an issue with the query" do
    result = @database.query('this is an invalid query')
    expect(result).to eq("Invalid query")
  end
end

