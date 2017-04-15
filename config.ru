require './app'
require_relative 'bot'

require 'facebook/messenger'

# run both Sinatra and facebook-messenger on /webhook
map("/webhook") do
    run Sinatra::Application
    run Facebook::Messenger::Server
end

# handle "/" with sinatra
run Sinatra::Application

