defmodule MusicPlaylistWeb.UserResolverTest do
  use MusicPlaylistWeb.ConnCase
  import MusicPlaylistWeb.GraphqlHelpers
  import MusicPlaylist.{AccountsFixtures, PlansFixtures}

  setup do
    :ok
  end

  @query """
  mutation SignUp($email: String!, $password: String!){
    signup(email: $email, password: $password){
      token
    }
  }
  """

  test "Register a new user", %{conn: conn} do
    %{data: %{signup: %{token: _token, user: user}}} =
      conn
      |> graphql_query(
        query: @query,
        variables: %{
          email: "testing@example.com",
          password: "password",
        }
      )

    assert user.email == "testing@example.com"
  end
end
