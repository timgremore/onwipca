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
alias Onwipca.User
alias Onwipca.Church
alias Onwipca.Pathway

case Repo.get_by(Pathway, name: "Strategic Planning") do
  nil -> Pathway.changeset(%Pathway{}, %{
           name: "Strategic Planning",
           readiness: "Ready Now - MNA Assessment approved",
           location: "Strategic areas",
           training: "Provisional session and coach",
           sender: "Wisconsin MNA Committee",
           position: 1
         })
         |> Repo.insert_or_update
  pathway -> pathway
end

case Repo.get_by(Pathway, name: "Apprentice Planting") do
  nil -> Pathway.changeset(%Pathway{}, %{
           name: "Apprentice Planting",
           readiness: "Need 1-3 year internship (ordainable seminary education)",
           location: "Within 45 minutes of established church",
           training: "Above plus internship with sending church",
           sender: "Local church",
           position: 2
         })
         |> Repo.insert_or_update
  pathway -> pathway
end

case Repo.get_by(Pathway, name: "Indigenous Planting") do
  nil -> Pathway.changeset(%Pathway{}, %{
           name: "Indigenous Planting",
           readiness: "5 year church planting training within a program in conjunction with reformed theological seminary",
           location: "Rural areas, ethnic populations, cities and suburbs",
           training: "\"On Wisconsin\" training program",
           sender: "Network or local church",
           position: 3
         })
         |> Repo.insert_or_update
  pathway -> pathway
end

user_params = %{
  username: "iam",
  first_name: "I",
  last_name: "Am",
  email: "i@am.com",
  password: "secret"
}

founder = case Repo.get_by(User, username: "iam") do
            nil ->
              User.auth_changeset(%User{}, user_params)
              |> Repo.insert_or_update
            user -> user
          end

photo_dir = Path.join(~w(#{File.cwd!} priv repo churches))

case Repo.get_by(Church, name: "Christ Covenant Church") do
  nil -> Church.changeset(%Church{}, %{
            name: "Christ Covenant Church",
            street: "3630 Co Rd B",
            city: "La Crosse",
            state: "WI",
            zipcode: "54601",
            particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0},
            url: "http://ccc-pca.org",
            founder: founder,
            stage: 5,
            photo: %Plug.Upload{filename: "christ-covenant.jpg", path: Path.join(photo_dir, "christ-covenant.jpg")}
          })
          |> Repo.insert_or_update
  church -> church
end

case Repo.get_by(Church, name: "Grace Presbyterian Church") do
  nil -> Church.changeset(%Church{}, %{
            name: "Grace Presbyterian Church",
            street: "N7631 WI-22",
            city: "Pardeeville",
            state: "WI",
            zipcode: "53954",
            particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0},
            url: "http://gracepresinfo.com",
            founder: founder,
            stage: 5,
            photo: %Plug.Upload{filename: "grace-presbyterian.jpg", path: Path.join(photo_dir, "grace-presbyterian.jpg")}
          })
          |> Repo.insert_or_update
  church -> church
end

case Repo.get_by(Church, name: "Lake Trails Church") do
  nil -> Church.changeset(%Church{}, %{
            name: "Lake Trails Church",
            street: "1 Point Place Suite 1",
            city: "Madison",
            state: "WI",
            zipcode: "53719",
            particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0},
            url: "http://laketrailschurch.org",
            founder: founder,
            stage: 5,
            photo: %Plug.Upload{filename: "lake-trails.jpg", path: Path.join(photo_dir, "lake-trails.jpg")}
          })
          |> Repo.insert_or_update
  church -> church
end

case Repo.get_by(Church, name: "Bible Presbyterian Church") do
  nil -> Church.changeset(%Church{}, %{
            name: "Bible Presbyterian Church",
            street: "1605 Hwy G",
            city: "Merrill",
            state: "WI",
            zipcode: "54452",
            particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0},
            url: "http://www.biblepreschurch.org",
            founder: founder,
            stage: 5,
            photo: %Plug.Upload{filename: "bible-presbyterian.jpg", path: Path.join(photo_dir, "bible-presbyterian.jpg")}
          })
          |> Repo.insert_or_update
  church -> church
end

case Repo.get_by(Church, name: "Trinity Presbyterian Church") do
  nil -> Church.changeset(%Church{}, %{
            name: "Trinity Presbyterian Church",
            street: "224 N.Hine Ave",
            city: "Waukesha",
            state: "WI",
            zipcode: "53188",
            particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0},
            url: "http://trinitypresbyterianwi.org",
            founder: founder,
            stage: 5,
            photo: %Plug.Upload{filename: "trinity-presbyterian.jpg", path: Path.join(photo_dir, "trinity-presbyterian.jpg")}
          })
          |> Repo.insert_or_update
  church -> church
end

case Repo.get_by(Church, name: "Cornerstone Presbyterian Church") do
  nil -> Church.changeset(%Church{}, %{
            name: "Cornerstone Presbyterian Church",
            street: "N6 W31449 Alberta Drive",
            city: "Delafield",
            state: "WI",
            zipcode: "53018",
            particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0},
            url: "http://www.cornerstone-pca.com",
            founder: founder,
            stage: 5,
            photo: %Plug.Upload{filename: "cornerstone-presbyterian.jpg", path: Path.join(photo_dir, "cornerstone-presbyterian.jpg")}
          })
          |> Repo.insert_or_update
  church -> church
end
