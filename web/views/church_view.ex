defmodule OnWiPca.ChurchView do
  use OnWiPca.Web, :view

  def render("index.json", %{churches: churches}) do
    %{data: render_many(churches, OnWiPca.ChurchView, "church.json")}
  end

  def render("show.json", %{church: church}) do
    %{data: render_one(church, OnWiPca.ChurchView, "church.json")}
  end

  def render("church.json", %{church: church}) do
    %{id: church.id,
      name: church.name,
      street: church.street,
      city: church.city,
      state: church.state,
      zipcode: church.zipcode,
      particularized_at: church.particularized_at}
  end
end
