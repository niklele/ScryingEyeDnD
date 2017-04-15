require 'facebook/messenger'
require 'dotenv/load'
include Facebook::Messenger
 
# Subcribe bot to page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
 
Bot.on :message do |message|
    # parse(message.text)
    message.reply(text: 'Hello!')
end

# parse eg 1d12+3
def parse(msg)
    rollPattern = /roll (?<n>\d+)d(?<f>\d+)\+?(?<c>\d+)?/i
    matches = rollPattern.match(msg)
    if matches.nil?
        return nil
    end
    n = matches['n']
    f = matches['f']
    c = matches['c'].nil? ? 0 : matches['c']
    return n, f, c
end

# roll n dice with f faces each, and add c at the end
def roll(n, f, c)
    s = 0
    (0..n).each do
        s += rand(f) + 1
    end
    return s + c
end