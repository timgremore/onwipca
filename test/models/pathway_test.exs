defmodule Onwipca.PathwayTest do
  use Onwipca.ModelCase

  alias Onwipca.Pathway

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pathway.changeset(%Pathway{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pathway.changeset(%Pathway{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "church_count" do
    pathway = insert(:pathway)
    insert(:church, pathway_id: pathway.id)
    insert(:church, pathway_id: pathway.id)
    insert(:church)

    assert Pathway.church_count(pathway) == 2
  end
end
