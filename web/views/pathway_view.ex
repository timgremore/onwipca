defmodule Onwipca.PathwayView do
  use Onwipca.Web, :view

  def church_count(pathway) do
    Onwipca.Pathway.church_count(pathway)
  end

  def render("index.json", %{pathways: pathways}) do
    %{data: render_many(pathways, Onwipca.PathwayView, "pathway.json")}
  end

  def render("show.json", %{pathway: pathway}) do
    %{data: render_one(pathway, Onwipca.PathwayView, "pathway.json")}
  end

  def render("pathway.json", %{pathway: pathway}) do
    %{id: pathway.id,
      name: pathway.name,
      readiness: pathway.readiness,
      location: pathway.location,
      training: pathway.training,
      sender: pathway.sender,
      position: pathway.position}
  end
end
