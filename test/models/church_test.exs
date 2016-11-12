defmodule OnWiPca.ChurchTest do
  use OnWiPca.ModelCase

  alias OnWiPca.Church

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
end
