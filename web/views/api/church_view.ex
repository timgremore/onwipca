defmodule Onwipca.Api.ChurchView do
  use Onwipca.Web, :view

  def render("index.json", %{churches: churches}) do
    %{data: render_many(churches, Onwipca.Api.ChurchView, "church.json")}
  end

  def render("show.json", %{church: church}) do
    %{data: render_one(church, Onwipca.Api.ChurchView, "church.json")}
  end

  def render("church.json", %{church: church}) do
    %{id: church.id}
  end
end
