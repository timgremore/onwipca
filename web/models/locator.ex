defmodule Onwipca.Locator do
  import Ecto.Changeset

  def locate(changeset) do
    if get_change(changeset, :street) || get_change(changeset, :city) || get_change(changeset, :state) || get_change(changeset, :zipcode) do
      {:ok, coords} = Geocoder.call("#{get_change(changeset, :street)} #{get_change(changeset, :city)}, #{get_change(changeset, :state)} #{get_change(changeset, :zipcode)}")
      changeset
        |> change(latitude: coords.lat, longitude: coords.lon)
    else
      changeset
    end
  end
end
