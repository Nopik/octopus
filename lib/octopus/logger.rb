require "logger"

class Octopus::Logger < Logger
  def format_message(severity, timestamp, progname, msg)
    str = super 
    
    if ActiveRecord::Base.connection.respond_to?(:current_shard)
      str = "Shard: #{ActiveRecord::Base.connection.current_shard} - " + str 
		else
			str = "Unknown shard - " + str
    end
    
    str
  end
end

