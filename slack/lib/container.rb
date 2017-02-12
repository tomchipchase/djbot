require "dry/container"
require "rspotify"
require "sonos"

require "actions"

Container = Dry::Container.new

Container.namespace(:spotify) do
  register(:track_repo, RSpotify::Track)
end

Container.namespace(:sonos) do
  register(:system, Sonos::System.new)
end

Container.namespace(:actions) do
  register(
    :search_spotify,
    Actions::SearchSpotify.curry[Container[:"spotify.track_repo"]]
  )

  register(
    :add_song_to_sonos,
    # Actions::AddSongToSonos.curry[Container[:"sonos.system"]]
    Actions::NullAction
  )
end
