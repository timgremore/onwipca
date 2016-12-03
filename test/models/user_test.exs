defmodule Onwipca.UserTest do
  use Onwipca.ModelCase

  alias Onwipca.User

  @valid_attrs %{admin: true, username: "user1", email: "user@example.com", first_name: "User", last_name: "One"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
