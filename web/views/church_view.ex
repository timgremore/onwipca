defmodule Onwipca.ChurchView do
  use Onwipca.Web, :view

  alias Onwipca.User
  alias Onwipca.Pathway
  alias Onwipca.UserView

  def pathways do
    Pathway.pathways
  end

  def pathway_name(pathway) do
    if Ecto.assoc_loaded?(pathway) do
      pathway.name
    else
      "missing"
    end
  end

  def founder_options_for_select do
    User.founders
    |> Enum.map(&{founder_name(&1), &1.id})
  end

  def founder_name(nil) do
    ""
  end

  def founder_name(user) do
    if Ecto.assoc_loaded?(user) do
      "#{user.first_name} #{user.last_name}"
    else
      ""
    end
  end

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
      founder: render_one(church.founder, UserView, "user.json"),
      latitude: church.latitude,
      longitude: church.longitude,
      pathway_id: church.pathway_id,
      logo: Onwipca.Photo.url({church.logo, church})}
  end
end
