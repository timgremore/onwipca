defmodule Onwipca.ChurchTest do
  use Onwipca.ModelCase

  alias Onwipca.Church

  @valid_attrs %{city: "some content", name: "some content", particularized_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, state: "some content", street: "some content", zipcode: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Church.changeset(%Church{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Church.changeset(%Church{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "geocode address" do
    changeset = Church.changeset(%Church{}, %{
                                   name: "Jacob's Well",
                                   street: "3340 Lineville Rd.",
                                   city: "Howard",
                                   state: "WI",
                                   url: "http://jacobswellgb.com",
                                   particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0},
                                   zipcode: "54313"
                                 })
    Repo.insert!(changeset)
    church = Repo.one(from x in Onwipca.Church, order_by: [desc: x.id], limit: 1)

    assert church.latitude
    assert church.longitude
  end
end
