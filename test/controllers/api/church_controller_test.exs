defmodule Onwipca.Api.ChurchControllerTest do
  use Onwipca.ConnCase

  alias Onwipca.Api.Church
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, church_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    church = Repo.insert! %Church{}
    conn = get conn, church_path(conn, :show, church)
    assert json_response(conn, 200)["data"] == %{"id" => church.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, church_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, church_path(conn, :create), church: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Church, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, church_path(conn, :create), church: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    church = Repo.insert! %Church{}
    conn = put conn, church_path(conn, :update, church), church: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Church, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    church = Repo.insert! %Church{}
    conn = put conn, church_path(conn, :update, church), church: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    church = Repo.insert! %Church{}
    conn = delete conn, church_path(conn, :delete, church)
    assert response(conn, 204)
    refute Repo.get(Church, church.id)
  end
end
