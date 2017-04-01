defmodule Onwipca.Repo.Migrations.ChangePathwaysColumnsToText do
  use Ecto.Migration

  def change do
    alter table(:pathways) do
      modify :readiness, :text
      modify :location, :text
      modify :training, :text
      modify :sender, :text
    end
  end
end
