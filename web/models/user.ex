defmodule Onwipca.User do
  use Onwipca.Web, :model
  use Arc.Ecto.Schema

  alias Openmaize.Database, as: DB
  alias Onwipca.Church

  schema "users" do
    field :username, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :photo, Onwipca.Photo.Type

    has_many :churches, Church, foreign_key: :founder_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :first_name, :last_name])
    |> cast_attachments(params, [:photo])
    |> validate_required([:username, :email])
    |> unique_constraint(:username)
  end

  def auth_changeset(struct, params) do
    struct
    |> changeset(params)
    |> DB.add_password_hash(params)
  end
end
