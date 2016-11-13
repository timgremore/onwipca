defmodule Onwipca.PageController do
  use Onwipca.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
