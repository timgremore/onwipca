defmodule OnWiPca.SignupTest do
  use OnWiPca.IntegrationCase

  alias OnWiPca.User

  setup _context do
    user = %User{
      first_name: "Jonathan",
      last_name: "Edwards",
      email: "jon@onwipca.com",
      username: "jon"
    }
    |> User.changeset(%{password: "secret"})
    |> Repo.insert!

    {:ok, %{user: user}}
  end

  @tag :integration
  test "Signup", context do
    navigate_to "/"

    assert page_source =~ "On WI PCA"
  end
end
