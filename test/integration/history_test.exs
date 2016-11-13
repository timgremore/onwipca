defmodule Onwipca.HistoryTest do
  use Onwipca.IntegrationCase

  alias Onwipca.Church

  setup _context do
    church = %Church{
      name: "Christ Covenant Church",
      city: "La Crosse",
      state: "WI",
      zipcode: "54601",
      particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0}
    }
    |> Repo.insert!

    {:ok, %{church: church}}
  end

  @tag :integration
  test "History", context do
    navigate_to "/"

    assert page_source =~ "Christ Covenant Church"
    assert page_source =~ "La Crosse"
  end
end

