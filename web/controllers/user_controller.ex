defmodule Onwipca.UserController do
  use Onwipca.Web, :controller
  use Guardian.Phoenix.Controller

  def show(conn, _params, user, _claims) do
    render(conn, "show.html", current_user: user)
  end
end
