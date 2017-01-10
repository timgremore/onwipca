defmodule Onwipca.PathwaysTest do
  use Onwipca.IntegrationCase

  setup _context do
    params = %{name: "Church One"}
    church = insert(:church, params)

    {:ok, %{church: church}}
  end

  @tag :integration
  test "Pathways", _ do
    navigate_to "/"

    assert page_source =~ "Pathway One"
    assert page_source =~ "Church One"
  end
end

