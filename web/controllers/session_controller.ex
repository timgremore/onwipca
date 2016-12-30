defmodule Onwipca.SessionController do
  use Onwipca.Web, :controller

  import Onwipca.Authorize

  def new(conn, _params) do
    render conn, "new.html"
  end
end
