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

    help do
      title "add"
      desc "Search for a song on spotify and play it"
      long_desc "I'm not very clever so I'll just play the first thing I find."
    end

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
