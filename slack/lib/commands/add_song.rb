require "auto_inject"

module Commands
  class AddSong < SlackRubyBot::Commands::Base
    include AutoInject[
      :"actions.search_spotify",
      :"actions.add_song_to_sonos"
    ]

    def self.call(client, data, match)
      new.call(client, data, match)
    end

    command "add"

    def call(client, data, match)
      track = search_spotify.(match["expression"]).first
      add_song_to_sonos.(track.id)

      client.say(
        text: "Queued up #{track.name} by #{track.artists.map(&:name).join(", ")}",
        channel: data.channel
      )
    end
  end
end
