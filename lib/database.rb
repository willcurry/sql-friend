require 'pg'

class Database
  def initialize(database_name)
    @database_name = database_name
  end

  def connect
    @connection = PG::Connection.open(:dbname => @database_name)
    if @connection
      return "Connected"
    else
      return "Failed to connect"
    end
  end

  def query(query)
    result = @connection.exec_params(query)
    return format(result)
  end

  def close_connection
    @connection.finish
  end

  private

  def format(result)
    data = []
    result.each do |row|
      data << row
    end
  end
end
