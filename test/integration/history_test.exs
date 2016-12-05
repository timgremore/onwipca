defmodule Onwipca.HistoryTest do
  use Onwipca.IntegrationCase

  alias Onwipca.User
  alias Onwipca.Church

  setup _context do
    user_params = %{
      username: "iam",
      first_name: "I",
      last_name: "Am",
      email: "i@am.com",
      password: "secret"
    }

    church_params = %{
      name: "Christ Covenant Church",
      street: "3630 Co Rd B",
      city: "La Crosse",
      state: "WI",
      zipcode: "54601",
      particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0}
    }

    church_changeset = Church.changeset(%Church{}, church_params)

    founder = User.changeset(%User{}, user_params)
    |> Ecto.Changeset.put_assoc(:churches, [church_changeset])
    |> Repo.insert!

    {:ok, %{founder: founder}}
  end

  @tag :integration
  test "History", context do
    navigate_to "/"

    assert page_source =~ "Christ Covenant Church"
    assert page_source =~ "La Crosse"
    assert page_source =~ "Jan 1st, 1992"
    assert page_source =~ "I Am"
  end
end

