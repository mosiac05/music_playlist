defmodule MusicPlaylist.Musics do
  @moduledoc """
  The Musics context.
  """

  import Ecto.Query, warn: false
  alias MusicPlaylist.Repo

  alias MusicPlaylist.Musics.Music

  @doc """
  Checks if a music exists by its `id`

  ## Examples

      iex> check_music_exists?(123)
      true

  """
  def check_music_exists?(music_id) do
    query =
      from m in Music,
      where: m.id == ^music_id

    Repo.exists?(query)
  end

  @doc """
  Returns the list of musics.

  ## Examples

      iex> list_musics()
      [%Music{}, ...]

  """
  def list_musics do
    Repo.all(Music)
  end

  @doc """
  Gets a single music.

  Raises `Ecto.NoResultsError` if the Music does not exist.

  ## Examples

      iex> get_music!(123)
      %Music{}

      iex> get_music!(456)
      ** (Ecto.NoResultsError)

  """
  def get_music!(id), do: Repo.get!(Music, id)

  @doc """
  Gets a single music.

  Raises `Ecto.NoResultsError` if the Music does not exist.

  ## Examples

      iex> get_music!(123)
      %Music{}

      iex> get_music!(456)
      ** (Ecto.NoResultsError)

  """
  def get_music_with_plan(id) do
    query =
      from mp in Music,
      where: mp.id == ^id,
      preload: :plan

    Repo.one!(query)
  end

  @doc """
  Creates a music.

  ## Examples

      iex> create_music(%{field: value})
      {:ok, %Music{}}

      iex> create_music(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_music(attrs \\ %{}) do
    %Music{}
    |> Music.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a music.

  ## Examples

      iex> update_music(music, %{field: new_value})
      {:ok, %Music{}}

      iex> update_music(music, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_music(%Music{} = music, attrs) do
    music
    |> Music.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a music.

  ## Examples

      iex> delete_music(music)
      {:ok, %Music{}}

      iex> delete_music(music)
      {:error, %Ecto.Changeset{}}

  """
  def delete_music(%Music{} = music) do
    Repo.delete(music)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking music changes.

  ## Examples

      iex> change_music(music)
      %Ecto.Changeset{data: %Music{}}

  """
  def change_music(%Music{} = music, attrs \\ %{}) do
    Music.changeset(music, attrs)
  end
end
