defmodule OnWiPca.User do
  use OnWiPca.Web, :model

  alias Openmaize.Database, as: DB

  schema "users" do
    field :username, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email])
    |> validate_required([:username, :email])
    |> unique_constraint(:username)
  end

  def auth_changeset(struct, params) do
    struct
    |> changeset(params)
    |> DB.add_password_hash(params)
  end
end
