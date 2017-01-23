defmodule Onwipca.Repo.Migrations.CreatePathway do
  use Ecto.Migration

  def change do
    create table(:pathways) do
      add :name, :string
      add :readiness, :string
      add :location, :string
      add :training, :string
      add :sender, :string
      add :position, :integer

      timestamps()
    end

  end
end
