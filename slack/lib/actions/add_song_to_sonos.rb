require "sonos"

module Actions
  AddSongToSonos = ->(system, spotify_id) {
    speaker = system.speakers.first

    speaker.add_spotify_to_queue(spotify_id)
  }
end
