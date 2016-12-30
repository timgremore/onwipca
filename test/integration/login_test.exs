defmodule Onwipca.LoginTest do
  use Onwipca.IntegrationCase

  setup do
    insert(:user, %{username: "jb", first_name: "John", last_name: "Baptist", password: "secret"})

    {:ok, %{}}
  end

  @tag :integration
  test "Login" do
    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:name, "submit"})

    assert page_source =~ "Welcome John Baptist"
  end
end
