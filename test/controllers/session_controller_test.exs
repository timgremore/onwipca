defmodule OnWiPca.SessionControllerTest do
  use OnWiPca.ConnCase

  import OnWiPca.TestHelpers

  @valid_attrs %{username: "robin", password: "mangoes&g0oseberries"}
  @invalid_attrs %{username: "robin", password: "maaaangoes&g00zeberries"}

  setup %{conn: conn} do
    conn = conn |> bypass_through(OnWiPca.Router, :browser) |> get("/")
    user = add_user("robin")

    {:ok, %{conn: conn, user: user}}
  end

  test "login succeeds", %{conn: conn} do
    conn = post conn, session_path(conn, :create), session: @valid_attrs
    assert redirected_to(conn) == user_path(conn, :index)
  end

  test "login fails", %{conn: conn} do
    conn = post conn, session_path(conn, :create), session: @invalid_attrs
    assert redirected_to(conn) == session_path(conn, :new)
  end

  test "logout succeeds", %{conn: conn, user: user} do
    conn = conn |> put_session(:user_id, user.id) |> send_resp(:ok, "/")
    conn = delete conn, session_path(conn, :delete, user)
    assert redirected_to(conn) == page_path(conn, :index)
  end

end
