defmodule Onwipca.Repo.Migrations.AddPathwayIdToChurches do
  use Ecto.Migration

  def change do
    alter table(:churches) do
      add :pathway_id, :integer, default: nil
    end
  end
end
