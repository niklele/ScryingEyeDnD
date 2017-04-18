require 'facebook/messenger'
require 'dotenv/load'
require 'sinatra/activerecord'
require_relative 'config/environments.rb'
require_relative 'models/spell.rb'
include Facebook::Messenger
 
# Subcribe bot to page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
    rollPattern = /roll (?<n>\d+)d(?<f>\d+)\+?(?<c>\d+)?/i
    matches = rollPattern.match(message.text)
    
    if !matches.nil?
        n = matches['n']
        f = matches['f']
        c = matches['c'].nil? ? 0 : matches['c']

        res = roll(n.to_i, f.to_i, c.to_i)
        message.reply(text: "Rolled #{res}")
    end
end

# roll n dice with f faces each, and add c at the end
def roll(n, f, c)
    s = 0
    (0..n).each do
        s += rand(f) + 1
    end
    return s + c
end