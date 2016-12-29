defmodule Onwipca.Repo.Migrations.AddStageToChurches do
  use Ecto.Migration

  def change do
    alter table(:churches) do
      add :stage, :integer, default: 1
    end
  end
end
