defmodule MusicPlaylist.Musics.Playlist do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :name, :string
    field :musics, {:array, :map}

    timestamps()
  end

  @doc false
  def changeset(playlist, attrs) do
    playlist
    |> cast(attrs, [:name, :musics])
    |> validate_required([:name, :musics])
  end
end
