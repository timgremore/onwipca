defmodule Onwipca.Api.PathwayController do
  use Onwipca.Web, :controller

  alias Onwipca.Pathway

  def index(conn, _params) do
    pathways = Repo.all(Pathway)
    render(conn, "index.json", pathways: pathways)
  end
end
