
#auto show logs when using rails2.x console, rails 3 default auto show logs on console 
def change_log(stream)
  ActiveRecord::Base.connection.instance_variable_set :@logger, Logger.new(stream)
  #ActiveRecord::Base.logger = Logger.new(stream)
  #ActiveRecord::Base.clear_active_connections!
end

def show_log
  change_log(STDOUT)
end

def hide_log
  change_log(nil)
end

if ENV['RAILS_ENV']
  # Called after the irb session is initialized and Rails has been loaded
  IRB.conf[:IRB_RC] = Proc.new do
    show_log
  end
end
