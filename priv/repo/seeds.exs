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

{:ok, pathway_one} = case Repo.get_by(Pathway, name: "Path 1: Planting") do
                      nil -> Pathway.changeset(%Pathway{}, %{
                              name: "Path 1: Planting",
                              readiness: "Ready Now - MNA assessment approved and ordained",
                              location: "Strategic areas",
                              training: "Provisional session and coach",
                              sender: "Wisconsin MNA Committee",
                              position: 1
                            })
                            |> Repo.insert_or_update
                      pathway -> pathway
                    end

{:ok, pathway_two} = case Repo.get_by(Pathway, name: "Path 2: Apprentice Planting") do
                        nil -> Pathway.changeset(%Pathway{}, %{
                                name: "Path 2: Apprentice Planting",
                                readiness: "Need 1-3 year internship (ordainable seminary education)",
                                location: "Within 45 minutes of established church",
                                training: "Above plus internship with sending church",
                                sender: "Local church",
                                position: 2
                              })
                              |> Repo.insert_or_update
                        pathway -> pathway
                      end

{:ok, pathway_three} = case Repo.get_by(Pathway, name: "Path 3: Indigenous Planting") do
                          nil -> Pathway.changeset(%Pathway{}, %{
                                  name: "Path 3: Indigenous Planting",
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
  username: "timgremore",
  first_name: "Tim",
  last_name: "Gremore",
  email: "timgremore@gmail.com",
  password: "secret"
}

founder = case Repo.get_by(User, username: "timgremore") do
            nil ->
              User.auth_changeset(%User{}, user_params)
              |> Repo.insert_or_update
            user -> user
          end

logo_dir = Path.join(~w(#{File.cwd!} priv repo churches))

# Particularized churches between 1992-2012
#
#
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
            logo: %Plug.Upload{filename: "emmaus-road-logo.png", path: Path.join(logo_dir, "emmaus-road-logo.png")}
          })
          |> Repo.insert_or_update!
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
            logo: %Plug.Upload{filename: "jacobs-well-logo.png", path: Path.join(logo_dir, "jacobs-well-logo.png")}
          })
          |> Repo.insert_or_update!
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
            logo: %Plug.Upload{filename: "emmaus-road-logo.png", path: Path.join(logo_dir, "emmaus-road-logo.png")}
          })
          |> Repo.insert_or_update!
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
            logo: %Plug.Upload{filename: "jacobs-well-logo.png", path: Path.join(logo_dir, "jacobs-well-logo.png")}
          })
          |> Repo.insert_or_update!
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
            logo: %Plug.Upload{filename: "emmaus-road-logo.png", path: Path.join(logo_dir, "emmaus-road-logo.png")}
          })
          |> Repo.insert_or_update!
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
            logo: %Plug.Upload{filename: "jacobs-well-logo.png", path: Path.join(logo_dir, "jacobs-well-logo.png")}
          })
          |> Repo.insert_or_update!
  church -> church
end
#
#
# END

#
#
# Pathway 1 churches
case Repo.get_by(Church, name: "Christ Church Milwaukee") do
  nil -> Church.changeset(%Church{}, %{
            name: "Christ Church Milwaukee",
            street: "1661 N. Farwell Ave.",
            city: "Milwaukee",
            state: "WI",
            zipcode: "53202",
            url: "http://www.christchurchmke.org",
            logo: %Plug.Upload{filename: "christ-church-milwaukee-logo.png", path: Path.join(logo_dir, "christ-church-milwaukee-logo.png")},
            contact: "Jon and Carrie Talley",
            pathway_id: pathway_one.id,
          })
          |> Repo.insert_or_update!
  church -> church
end

# Pathway 2 churches
case Repo.get_by(Church, name: "Friend of Sinners") do
  nil -> Church.changeset(%Church{}, %{
            name: "Friend of Sinners",
            city: "Milwaukee",
            state: "WI",
            zipcode: "53202",
            url: "http://www.friendofsinners.org",
            logo: %Plug.Upload{filename: "friend-of-sinners-logo.png", path: Path.join(logo_dir, "friend-of-sinners-logo.png")},
            contact: "Dan and Sherri Quakkelaar",
            pathway_id: pathway_two.id,
          })
          |> Repo.insert_or_update!
  church -> church
end

# Pathway 3 churches
case Repo.get_by(Church, name: "Resurrection Presbyterian") do
  nil -> Church.changeset(%Church{}, %{
            name: "Resurrection Presbyterian",
            city: "Madison",
            state: "WI",
            zipcode: "53705",
            url: "http://www.resurrectionmadison.com",
            logo: %Plug.Upload{filename: "resurrection-madison-logo.jpg", path: Path.join(logo_dir, "resurrection-madison-logo.jpg")},
            contact: "Matt and April Grimsley",
            pathway_id: pathway_three.id,
          })
          |> Repo.insert_or_update!
  church -> church
end
