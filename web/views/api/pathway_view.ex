defmodule Onwipca.Api.PathwayView do
  use Onwipca.Web, :view

  def render("index.json", %{pathways: pathways}) do
    %{data: render_many(pathways, Onwipca.Api.PathwayView, "pathway.json")}
  end

  def render("show.json", %{pathway: pathway}) do
    %{data: render_one(pathway, Onwipca.Api.PathwayView, "pathway.json")}
  end

  def render("pathway.json", %{pathway: pathway}) do
    %{id: pathway.id}
  end
end
