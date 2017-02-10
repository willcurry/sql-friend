require 'pg'

class Database
  def initialize(database_name)
    @database_name = database_name
  end

  def connect
    begin
      @connection = PG::Connection.open(:dbname => @database_name)
    rescue
      return "Failed to connect"
    end
    return "Connected"
  end

  def query(query)
    connect
    data = send(query)
    disconnect
    data
  end

  def disconnect
    @connection.finish
  end

  private

  def send(query)
    begin
      result = @connection.exec_params(query)
      format(result)
    rescue
      "Invalid query"
    end
  end

  def format(result)
    data = []
    result.each do |row|
      data << row
    end
  end
end
