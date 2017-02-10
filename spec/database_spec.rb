require 'database'

RSpec.describe Database do
  it "connects successfully" do
    database = Database.new
    expect(database.connect).to eq("Connected")
    database.close_connection
  end

  it "gets correct results from database" do
    database = Database.new
    database.connect
    result = database.query('SELECT * FROM test;')
    expect(result.first["name"]).to eq("Will")
    database.close_connection
  end
end
