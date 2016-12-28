defmodule Onwipca.ChurchTest do
  use Onwipca.ModelCase

  alias Onwipca.Church

  test "changeset with valid attributes" do
    changeset = Church.changeset(%Church{}, params_for(:church, %{}))
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Church.changeset(%Church{}, %{})
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

    assert church.latitude == 44.591721
    assert church.longitude == -88.1114039
  end

  test "stages" do
    church = insert(:church, %{})
    assert Church.current_stage(church) == :new

    {:ok, church} = Church.next_stage(church)
    assert Church.current_stage(church) == :pathway_three

    {:ok, church} = Church.next_stage(church)
    assert Church.current_stage(church) == :pathway_two

    {:ok, church} = Church.next_stage(church)
    assert Church.current_stage(church) == :pathway_one

    {:ok, church} = Church.next_stage(church)
    assert Church.current_stage(church) == :particularized
    assert church.particularized_at
  end
end
