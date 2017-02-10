require 'pg'

class Database
  def connect
    @connection = PG::Connection.open(:dbname => 'willcurry')
    if @connection
      return "Connected"
    else
      return "Failed to connect"
    end
  end

  def query(query)
    result = @connection.exec_params(query)
    data = []
    result.each do |row|
      data << row
    end
    return data
  end

  def close_connection
    @connection.finish
  end
end
