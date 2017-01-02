defmodule Onwipca.LoginTest do
  use Onwipca.IntegrationCase

  alias Onwipca.User

  setup do
    User.auth_changeset(%User{}, params_for(:user, %{username: "jb", first_name: "John", last_name: "Baptist", password: "secret"}))
    |> Repo.insert

    {:ok, %{}}
  end

  @tag :integration
  test "Login" do
    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:id, "login-form"})

    assert page_source =~ "Welcome John Baptist"
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
