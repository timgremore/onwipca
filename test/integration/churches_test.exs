defmodule Onwipca.ChurchesTest do
  use Onwipca.IntegrationCase

  alias Onwipca.Repo
  alias Onwipca.User
  alias Onwipca.Church

  setup do
    User.auth_changeset(%User{}, params_for(:user, password: "secret", username: "jb"))
    |> Repo.insert

    insert(:church, name: "Jacob's Well")

    {:ok, %{}}
  end

  @tag :integration
  test "Create a new church" do
    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:id, "login-form"})

    click({:link_text, "Create Church"})
    fill_field({:id, "church_name"}, "Jacob's Well")
    submit_element({:id, "church-form"})

    assert page_source =~ "Church created successfully"
    assert page_source =~ "Jacob's Well"
  end
end
