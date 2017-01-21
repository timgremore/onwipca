defmodule Onwipca.Api.ChurchController do
  use Onwipca.Web, :controller

  alias Onwipca.Church

  def index(conn, _params) do
    churches = Repo.all(Church) |> Repo.preload(:founder)
    render(conn, "index.json", churches: churches)
  end
end
