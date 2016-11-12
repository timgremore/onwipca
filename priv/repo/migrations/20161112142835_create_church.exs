defmodule OnWiPca.Repo.Migrations.CreateChurch do
  use Ecto.Migration

  def change do
    create table(:churches) do
      add :name, :string
      add :street, :string
      add :city, :string
      add :state, :string
      add :zipcode, :string
      add :particularized_at, :datetime

      timestamps()
    end

  end
end
