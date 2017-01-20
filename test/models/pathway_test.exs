defmodule Onwipca.PathwayTest do
  use Onwipca.ModelCase

  alias Onwipca.Pathway

  @valid_attrs %{description: "some content", name: "some content", position: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pathway.changeset(%Pathway{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pathway.changeset(%Pathway{}, @invalid_attrs)
    refute changeset.valid?
  end
end
