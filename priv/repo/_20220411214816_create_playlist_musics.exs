defmodule MusicPlaylist.Repo.Migrations.CreatePlaylistMusics do
  use Ecto.Migration

  def change do
    create table(:playlist_musics) do
      add :playlist_id, references(:playlists, on_delete: :nothing)
      add :music_id, references(:musics, on_delete: :nothing)

      timestamps()
    end

    create index(:playlist_musics, [:playlist_id])
    create index(:playlist_musics, [:music_id])
  end
end
