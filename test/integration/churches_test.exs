defmodule Onwipca.ChurchesTest do
  use Onwipca.IntegrationCase

  alias Onwipca.Repo
  alias Onwipca.User

  setup do
    User.auth_changeset(%User{}, params_for(:user, password: "secret", username: "jb"))
    |> Repo.insert

    insert(:church, name: "Living Stone")

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
    fill_field({:id, "church_url"}, "www.jacobswellgb.org")
    fill_field({:id, "church_street"}, "3340 Lineville Rd.")
    fill_field({:id, "church_city"}, "Howard")
    fill_field({:id, "church_state"}, "WI")
    fill_field({:id, "church_zipcode"}, "54304")
    submit_element({:class, "form__church"})

    assert page_source =~ "Church created successfully"
    assert page_source =~ "Jacob's Well"
  end

  @tag :integration
  test "List churches" do
    insert(:church, name: "Emmaus Road")

    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:id, "login-form"})

    click({:link_text, "Churches"})

    assert page_source =~ "Living Stone"
    assert page_source =~ "Emmaus Road"
  end

  @tag :integration
  test "Delete church" do
    insert(:church, name: "Emmaus Road")

    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:id, "login-form"})

    click({:link_text, "Churches"})

    church_row = find_element(:css, "tr:last-child td:last-child")
    delete_link = find_within_element(church_row, :link_text, "Delete")
    click(delete_link)
    accept_dialog

    assert page_source =~ "Living Stone"
    assert page_source =~ "Church was deleted successfully"
    refute page_source =~ "Emmaus Road"
  end

  @tag :integration
  test "Edit church" do
    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:id, "login-form"})

    click({:link_text, "Churches"})

    click({:link_text, "Edit"})
  end

  @tag :integration
  test "Church founders" do
    founder = insert(:user, first_name: "John", last_name: "Baptist")

    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:id, "login-form"})

    click({:link_text, "Churches"})

    click({:link_text, "Edit"})

    click({:css, "option[value='#{founder.id}']"})

    submit_element({:class, "form__church"})

    assert page_source =~ "John Baptist"
  end
end
