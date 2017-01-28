defmodule Onwipca.PathwaysTest do
  use Onwipca.IntegrationCase

  alias Onwipca.User
  @tag :integration
  test "Pathways" do
    pathway_one = insert(:pathway,
                          %{name: "Pathway One",
                            readiness: "Readiness One",
                            location: "Location One",
                            training: "Training One",
                            sender: "Sender One",
                            position: 1})
    pathway_two = insert(:pathway,
                          %{name: "Pathway Two",
                            readiness: "Readiness Two",
                            location: "Location Two",
                            training: "Training Two",
                            sender: "Sender Two",
                            position: 2})
    insert(:church, %{name: "Jacob's Well", pathway_id: pathway_one.id})
    insert(:church, %{name: "Emmaus Road", pathway_id: pathway_two.id})


    navigate_to "/"

    assert page_source =~ "Pathway One"
    assert page_source =~ "Pathway Two"
  end

  @tag :integration
  test "Create pathway" do
    User.auth_changeset(%User{}, params_for(:user, password: "secret", username: "jb"))
    |> Repo.insert

    navigate_to "/"

    click({:link_text, "Login"})

    fill_field({:id, "user_username"}, "jb")
    fill_field({:id, "user_password"}, "secret")
    submit_element({:id, "login-form"})

    click({:link_text, "Pathways"})

    click({:link_text, "Create Pathway"})

    fill_field({:id, "pathway_name"}, "Pathway 1: Strategic Planning")
    fill_field({:id, "pathway_readiness"}, "Ready to go")
    fill_field({:id, "pathway_location"}, "Strategic location")
    fill_field({:id, "pathway_training"}, "Reformed seminary")
    fill_field({:id, "pathway_sender"}, "Local church partner")
    fill_field({:id, "pathway_position"}, "1")
    submit_element({:class, "form__pathway"})

    click({:link_text, "Show"})

    assert page_source =~ "Pathway 1: Strategic Planning"
    assert page_source =~ "Ready to go"
    assert page_source =~ "Strategic location"
    assert page_source =~ "Reformed seminary"
    assert page_source =~ "Local church partner"
    assert page_source =~ "1"
  end
end

