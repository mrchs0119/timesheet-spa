defmodule TimesheetspaWeb.SessionController do
  use TimesheetspaWeb, :controller

  action_fallback TimesheetspaWeb.FallbackController

  alias Timesheetspa.Users

  def create(conn, %{"email" => email, "password" => password}) do
    IO.inspect("seesion create")
    user = Users.authenticate_user(email, password)
    if user do
      token = Phoenix.Token.sign(conn, "session", user.id)
      resp = %{token: token, user_id: user.id, user_name: user.name}
      conn
      |> put_resp_header("content-type", "application/json; charset=UTF-8")
      |> send_resp(:created, Jason.encode!(resp))
    else
      resp = %{errors: ["Authentication Failed"]}
      conn
      |> put_resp_header("content-type", "application/json; charset=UTF-8")
      |> send_resp(:unauthorized, Jason.encode!(resp))
    end
  end
end
