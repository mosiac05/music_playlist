defmodule MusicPlaylistWeb.GraphqlHelpers do
  import Plug.Conn
  import Phoenix.ConnTest
  # We need to set the default endpoint for ConnTest
  @endpoint MusicPlaylistWeb.Endpoint

  def graphql_query(conn, options) do
    conn
    |> post(
        "/api",
        build_query(options[:query], options[:variables])
       )
    |> IO.inspect()
    |> json_response(200)
  end

  defp build_query(query, variables) do
    %{
      "query" => query,
      "variables" => variables
    }
  end
end
