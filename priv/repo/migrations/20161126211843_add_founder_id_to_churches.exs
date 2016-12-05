defmodule Onwipca.Repo.Migrations.AddFounderIdToChurches do
  use Ecto.Migration

  def change do
    alter table(:churches) do
      add :founder_id, references(:users)
    end
  end
end
