require "slack-ruby-bot"

class Bot < SlackRubyBot::Bot
  help do
    title "DJ"
    desc "Ask me to queue up music"
  end

  command "ping" do |client, data, match|
    client.say(text: "pong", channel: data.channel)
  end
end

require "commands"
