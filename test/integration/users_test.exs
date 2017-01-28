defmodule Onwipca.UsersTest do
  use Onwipca.IntegrationCase

  alias Onwipca.Repo
  alias Onwipca.User

  setup do
    User.auth_changeset(%User{}, params_for(:user, password: "secret", username: "jb"))
    |> Repo.insert

    {:ok, %{}}
  end

  test "Create a new user" do
    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:id, "login-form"})

    click({:link_text, "Create User"})

    fill_field({:id, "user_first_name"}, "John")
    fill_field({:id, "user_last_name"}, "Baptist")
    fill_field({:id, "user_email"}, "john@onwipca.com")
    fill_field({:id, "user_password"}, "secret")

    assert page_source =~ "User created successfully"
    assert page_source =~ "John Baptist"

    click({:link_text, "Logout"})

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:id, "login-form"})

    assert page_source =~ "Account"
  end
end
