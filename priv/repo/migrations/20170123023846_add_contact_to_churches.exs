defmodule Onwipca.Repo.Migrations.AddContactToChurches do
  use Ecto.Migration

  def change do
    alter table(:churches) do
      add :contact, :string
    end
  end
end
