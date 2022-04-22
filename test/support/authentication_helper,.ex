defmodule MusicPlaylist.AuthenticationHelper do
  def authenticate_user(conn, user) do
    {token, _} = MusicPlaylist.Accounts.UserToken.build_session_token(user)
    conn
    |> Plug.Conn.put_req_header("authorization", "Session #{token}")
  end
end
