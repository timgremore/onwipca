defmodule Onwipca.Api.ChurchView do
  use Onwipca.Web, :view

  def render("index.json", %{churches: churches}) do
    %{data: render_many(churches, Onwipca.ChurchView, "church.json")}
  end

  def render("show.json", %{church: church}) do
    %{data: render_one(church, Onwipca.ChurchView, "church.json")}
  end

  def render("church.json", %{church: church}) do
    %{id: church.id,
      name: church.name,
      contact: church.contact,
      street: church.street,
      city: church.city,
      state: church.state,
      zipcode: church.zipcode,
      particularized_at: church.particularized_at,
      url: church.url,
      founder: render_one(church.founder, Onwipca.UserView, "user.json"),
      latitude: church.latitude,
      longitude: church.longitude,
      pathway_id: church.pathway_id,
      logo: Onwipca.Photo.url({church.logo, church}, :medium)}
  end
end
