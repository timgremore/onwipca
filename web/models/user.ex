defmodule Onwipca.User do
  use Onwipca.Web, :model
  use Arc.Ecto.Schema

  alias Comeonin.Bcrypt
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
    |> validate_required([:username, :email])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> cast_attachments(params, [:photo])
  end

  def auth_changeset(struct, params) do
    struct
    |> changeset(params)
    |> cast(params, [:password])
    |> validate_required([:password])
    |> put_password_hash
  end

  def authenticate(user, password) do
    Bcrypt.checkpw(password, user.password_hash)
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
