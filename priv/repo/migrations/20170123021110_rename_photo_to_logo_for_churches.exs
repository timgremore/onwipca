defmodule Onwipca.Repo.Migrations.RenamePhotoToLogoForChurches do
  use Ecto.Migration

  def change do
    rename table(:churches), :photo, to: :logo
  end
end
