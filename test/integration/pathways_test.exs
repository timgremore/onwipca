defmodule Onwipca.PathwaysTest do
  use Onwipca.IntegrationCase

  setup _context do
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


    {:ok, %{}}
  end

  @tag :integration
  test "Pathways" do
    navigate_to "/"

    assert page_source =~ "Pathway One"
    assert page_source =~ "Jacob's Well"
    assert page_source =~ "Pathway Two"
    assert page_source =~ "Emmaus Road"
  end
end

