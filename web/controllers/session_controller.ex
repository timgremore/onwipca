defmodule Onwipca.SessionController do
  use Onwipca.Web, :controller

  alias Onwipca.User

  plug :scrub_params, "user" when action in [:create]

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => params}) do
    case User.find_and_authenticate(params) do
      {:ok, user, _} ->
          conn
          |> Guardian.Plug.sign_in(user)
          |> put_flash(:info, "Welcome #{user.first_name} #{user.last_name}")
          |> redirect(to: user_path(conn, :show))
      {:error, changeset, _} ->
        conn
        |> put_flash(:info, "Invalid username or password")
        |> render("new.html", changeset: changeset)
    end
  end

  def destroy(conn, _params) do
    conn
    |> Guardian.Plug.sign_out
    |> redirect(to: "/")
  end
end
