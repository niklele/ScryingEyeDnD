require 'facebook/messenger'
require 'dotenv/load'
include Facebook::Messenger
 
# Subcribe bot to page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
 
Bot.on :message do |message|
    message.reply(text: 'Hello!')
end