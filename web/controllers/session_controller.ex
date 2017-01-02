require IEx

defmodule Onwipca.SessionController do
  use Onwipca.Web, :controller

  alias Onwipca.User

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => params}) do
    case User.find_and_authenticate(params) do
      {:ok, user, _} ->
          conn
          |> Guardian.Plug.sign_in(user)
          |> redirect(to: user_path(conn, :show))
      {:error, changeset, _} ->
        conn
        |> put_flash(:info, "Invalid username or password")
        |> render("new.html", changeset: changeset)
    end
  end
end
