defmodule Onwipca.Repo.Migrations.AddPhotoToChurches do
  use Ecto.Migration

  def change do
    alter table(:churches) do
      add :photo, :string
    end
  end
end
