defmodule Onwipca.AccountController do
  use Onwipca.Web, :controller

  def show(conn, _params) do
    render conn, "show.html"
  end
end
