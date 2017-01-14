defmodule Onwipca.Api.ChurchView do
  use Onwipca.Web, :view

  alias Onwipca.UserView

  def render("index.json", %{churches: churches}) do
    %{data: render_many(churches, Onwipca.ChurchView, "church.json")}
  end

  def render("show.json", %{church: church}) do
    %{data: render_one(church, Onwipca.ChurchView, "church.json")}
  end

  def render("church.json", %{church: church}) do
    %{id: church.id,
      name: church.name,
      street: church.street,
      city: church.city,
      state: church.state,
      zipcode: church.zipcode,
      particularized_at: church.particularized_at,
      url: church.url,
      founder: render_one(church.founder, UserView, "user.json"),
      latitude: church.latitude,
      longitude: church.longitude,
      stage: church.stage,
      current_stage: Onwipca.Church.current_stage(church),
      photo: Onwipca.Photo.url({church.photo, church}, :medium)}
  end
end