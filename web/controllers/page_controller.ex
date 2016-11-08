defmodule OnWiPca.PageController do
  use OnWiPca.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
