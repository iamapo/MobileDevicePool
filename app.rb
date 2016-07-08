require 'sinatra/base'
require 'sinatra/contrib'
require 'haml'
require 'json'

require_relative 'routes/init'
require_relative 'helpers/init'

module MobileDevicePool
  class App < Sinatra::Base
    configure do
      root_dir = File.dirname(__FILE__)
      set :root, root_dir
      set :app_file, File.join(root_dir, File.basename(__FILE__))
      set :views, "#{root_dir}/views"
      set :public_folder, "#{root_dir}/public"
      set :screenshot_dir, "#{settings.public_folder}/img/screenshots"
      set :screenshot_files, []
      set :show_exceptions, :after_handler
      enable :sessions
      register Sinatra::Namespace
      helpers Sinatra::JSON
    end
  end
end