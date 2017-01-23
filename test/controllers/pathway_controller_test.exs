defmodule Onwipca.PathwayControllerTest do
  use Onwipca.ConnCase

  alias Onwipca.Pathway
  @valid_attrs %{description: "some content", name: "some content", position: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pathway_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pathways"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, pathway_path(conn, :new)
    assert html_response(conn, 200) =~ "New pathway"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, pathway_path(conn, :create), pathway: @valid_attrs
    assert redirected_to(conn) == pathway_path(conn, :index)
    assert Repo.get_by(Pathway, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pathway_path(conn, :create), pathway: @invalid_attrs
    assert html_response(conn, 200) =~ "New pathway"
  end

  test "shows chosen resource", %{conn: conn} do
    pathway = Repo.insert! %Pathway{}
    conn = get conn, pathway_path(conn, :show, pathway)
    assert html_response(conn, 200) =~ "Show pathway"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pathway_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    pathway = Repo.insert! %Pathway{}
    conn = get conn, pathway_path(conn, :edit, pathway)
    assert html_response(conn, 200) =~ "Edit pathway"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    pathway = Repo.insert! %Pathway{}
    conn = put conn, pathway_path(conn, :update, pathway), pathway: @valid_attrs
    assert redirected_to(conn) == pathway_path(conn, :show, pathway)
    assert Repo.get_by(Pathway, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pathway = Repo.insert! %Pathway{}
    conn = put conn, pathway_path(conn, :update, pathway), pathway: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit pathway"
  end

  test "deletes chosen resource", %{conn: conn} do
    pathway = Repo.insert! %Pathway{}
    conn = delete conn, pathway_path(conn, :delete, pathway)
    assert redirected_to(conn) == pathway_path(conn, :index)
    refute Repo.get(Pathway, pathway.id)
  end
end
