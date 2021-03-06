defmodule Chat.Accounts.Auth do
  alias Chat.Accounts.{Encryption, User}

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    IO.inspect user
    IO.inspect "###################################"
    case authenticate(user, params["password"])....hhhdo
      true ->
        {:ok, user}
      _  -> :error

    end
  end

  defp authenticate(user, password) do
    case user do
      nil -> false
       _   -> Encryption.validate_password(password, user.password_hash)

    end
  end
  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Chat.Repo.get(User, id)
  end

  def logged_in?(conn), do: !!current_user(conn)
end
