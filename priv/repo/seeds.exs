# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Onwipca.Repo.insert!(%Onwipca.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Onwipca.Repo
alias Onwipca.Church

church = %Church{
    name: "Christ Covenant Church",
    street: "3630 Co Rd B",
    city: "La Crosse",
    state: "WI",
    zipcode: "54601",
    particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0}
  }
  |> Repo.insert!

church = %Church{
    name: "Grace Presbyterian Church",
    street: "N7631 WI-22",
    city: "Pardeeville",
    state: "WI",
    zipcode: "53954",
    particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0}
  }
  |> Repo.insert!

church = %Church{
  name: "Lake Trails Church",
  street: "1 Point Place Suite 1",
  city: "Madison",
  state: "WI",
  zipcode: "53719",
  particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12,
  min: 0, sec: 0}
}
|> Repo.insert!

church = %Church{
  name: "Bible Presbyterian Church",
  street: "1605 Hwy G",
  city: "Merrill",
  state: "WI",
  zipcode: "54452",
  particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12,
  min: 0, sec: 0}
}
|> Repo.insert!

church = %Church{
  name: "Trinity Presbyterian Church",
  street: "224 N.Hine Ave",
  city: "Waukesha",
  state: "WI",
  zipcode: "53188",
  particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12,
  min: 0, sec: 0}
}
|> Repo.insert!

church = %Church{
  name: "Cornerstone Presbyterian Church",
  street: "N6 W31449 Alberta Drive",
  city: "Delafield",
  state: "WI",
  zipcode: "53018",
  particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12,
  min: 0, sec: 0}
}
|> Repo.insert!


# TODO: Add 4 other of the 6 churches that were particularized between 1992 and 2013
