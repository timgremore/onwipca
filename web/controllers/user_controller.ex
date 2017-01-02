defmodule Onwipca.UserController do
  use Onwipca.Web, :controller

  alias Onwipca.User

  # Thanks to https://dockyard.com/blog/2016/05/02/phoenix-tips-and-tricks
  def action(conn, _) do
    current_user = Guardian.Plug.current_resource(conn)
    args = [conn, conn.params, current_user || :guest]
    apply(__MODULE__, action_name(conn), args)
  end

  def show(conn, _params, current_user) do
    render(conn, "show.html", current_user: current_user)
  end
end
