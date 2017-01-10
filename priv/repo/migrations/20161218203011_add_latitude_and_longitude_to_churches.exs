defmodule Onwipca.Repo.Migrations.AddLatitudeAndLongitudeToChurches do
  use Ecto.Migration

  def change do
    alter table(:churches) do
      add :latitude, :float
      add :longitude, :float
    end
  end
end
