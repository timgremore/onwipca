defmodule Onwipca.User do
  use Onwipca.Web, :model
  use Arc.Ecto.Schema

  alias Comeonin.Bcrypt

  schema "users" do
    field :username, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :photo, Onwipca.Photo.Type

    has_many :churches, Onwipca.Church, foreign_key: :founder_id

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

  def find_and_authenticate(params) do
    if is_nil(params["username"]) || is_nil(params["password"]) do
      {:error, false, "Missing username or password"}
    else
      case Onwipca.Repo.get_by(Onwipca.User, username: params["username"]) do
        nil  -> {:error, false, "User not found"}
        user ->
          case authenticate(user, params["password"]) do
            true -> {:ok, user, nil}
            _    -> {:error, false, "Password invalid"}
          end
      end
    end
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
