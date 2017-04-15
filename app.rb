require 'sinatra'
require 'dotenv/load'

# verify with Facebook
get '/webhook' do
    if params['hub.verify_token'] == ENV['VERIFY_TOKEN']
        puts params['hub.challenge']
    end
end

get "/" do
    puts 'blah'
end