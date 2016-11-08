defmodule OnWiPca.UserTest do
  use OnWiPca.ModelCase

  alias OnWiPca.User

  @valid_attrs %{username: "fred", email: "fred@mail.com", password: "mangoes&gooseberries"}
  @invalid_attrs %{email: "fred@mail.com", password: "mangoes&gooseberries"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
