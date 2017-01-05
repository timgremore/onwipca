defmodule Onwipca.LoginTest do
  use Onwipca.IntegrationCase

  alias Onwipca.User

  setup do
    User.auth_changeset(%User{}, params_for(:user, %{username: "jb", first_name: "John", last_name: "Baptist", password: "secret"}))
    |> Repo.insert

    {:ok, %{}}
  end

  @tag :integration
  test "Login and logout" do
    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:id, "login-form"})

    assert page_source =~ "Welcome John Baptist"
    refute page_source =~ "Login"

    navigate_to "/"

    click({:link_text, "Account"})
    click({:link_text, "Logout"})

    assert page_source =~ "Login"
    refute page_source =~ "Logout"
  end

  @tag :integration
  test "Invalid login" do
    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "incorrect")
    submit_element({:id, "login-form"})

    assert page_source =~ "Invalid username or password"
  end
end
