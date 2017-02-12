require "rspotify"

module Actions
  SearchSpotify = ->(track_repo, search_term) do
    tracks = track_repo.search(search_term)
    tracks.first(3)
  end
end
