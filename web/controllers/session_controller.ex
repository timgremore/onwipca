defmodule Onwipca.SessionController do
  use Onwipca.Web, :controller

  import Onwipca.Authorize

  plug Openmaize.Login when action in [:create]
  #plug Openmaize.Login, [unique_id: :email] when action in [:create]

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(%Plug.Conn{private: %{openmaize_error: message}} = conn, _params) do
    auth_error conn, message, session_path(conn, :new)
  end
  def create(%Plug.Conn{private: %{openmaize_user: %{id: id}}} = conn, _params) do
    put_session(conn, :user_id, id)
    |> auth_info("You have been logged in", user_path(conn, :index))
  end

  def delete(conn, _params) do
    configure_session(conn, drop: true)
    |> auth_info("You have been logged out", page_path(conn, :index))
  end
end
