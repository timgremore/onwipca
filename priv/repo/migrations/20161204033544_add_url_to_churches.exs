defmodule Onwipca.Repo.Migrations.AddUrlToChurches do
  use Ecto.Migration

  def change do
    alter table(:churches) do
      add :url, :string
    end
  end
end
