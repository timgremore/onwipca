defmodule Onwipca.Api.PathwayControllerTest do
  use Onwipca.ConnCase

  alias Onwipca.Api.Pathway
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pathway_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    pathway = Repo.insert! %Pathway{}
    conn = get conn, pathway_path(conn, :show, pathway)
    assert json_response(conn, 200)["data"] == %{"id" => pathway.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pathway_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, pathway_path(conn, :create), pathway: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Pathway, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pathway_path(conn, :create), pathway: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    pathway = Repo.insert! %Pathway{}
    conn = put conn, pathway_path(conn, :update, pathway), pathway: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Pathway, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pathway = Repo.insert! %Pathway{}
    conn = put conn, pathway_path(conn, :update, pathway), pathway: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    pathway = Repo.insert! %Pathway{}
    conn = delete conn, pathway_path(conn, :delete, pathway)
    assert response(conn, 204)
    refute Repo.get(Pathway, pathway.id)
  end
end
