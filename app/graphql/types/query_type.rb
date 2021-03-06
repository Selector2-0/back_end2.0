module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :album, Types::AlbumType, null: false do
      argument :title, String, required: true
    end

    def album(title)
      DiscogsService.get_album_data(title[:title])
    end

    field :spotify_album_id, Types::AlbumType, null: false do
      argument :title, String, required: true
    end

    def spotify_album_id(title)
      SpotifyService.spotify_album_id(title[:title])
    end

    field :random_album, Types::RandomAlbumType, null: false

    def random_album
      DiscogsService.random_album
    end

    field :artist_albums, [Types::ArtistAlbumsType], null: false do
      argument :artist, String, required: true
    end

    def artist_albums(artist)
      DiscogsService.get_artist_albums(artist[:artist])
    end

    field :favorites, [Types::FavoriteType], null: true

    def favorites
      Favorite.all
    end
  end
end
