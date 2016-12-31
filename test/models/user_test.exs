defmodule Onwipca.UserTest do
  use Onwipca.ModelCase

  alias Onwipca.User

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, params_for(:user, %{}))
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, %{})
    refute changeset.valid?
  end

  test "changeset email is required" do
    changeset = User.changeset(%User{}, params_for(:user, %{email: ""}))
    refute changeset.valid?
  end

  test "changeset email must be unique" do
    insert(:user, email: "john@pca.com")
    assert {:error, changeset} = User.changeset(%User{}, params_for(:user, email: "john@pca.com"))
                                 |> Onwipca.Repo.insert
    assert changeset.errors[:email] == {"has already been taken", []}
  end

  test "changeset username is required" do
    changeset = User.changeset(%User{}, params_for(:user, %{username: ""}))
    refute changeset.valid?
  end

  test "changeset username must be unique" do
    insert(:user, username: "john")
    assert {:error, changeset} = User.changeset(%User{}, params_for(:user, username: "john"))
                                 |> Onwipca.Repo.insert
    assert changeset.errors[:username] == {"has already been taken", []}
  end

  test "authenticate a user" do
    {:ok, user} = User.auth_changeset(%User{}, params_for(:user, %{password: "secret123"}))
                  |> Onwipca.Repo.insert
    assert User.authenticate(user, "secret123")
    refute User.authenticate(user, "secret")
  end
end
