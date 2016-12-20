defmodule Onwipca.Church do
  use Onwipca.Web, :model
  use Arc.Ecto.Schema

  alias Onwipca.User

  schema "churches" do
    field :name, :string
    field :street, :string
    field :city, :string
    field :state, :string
    field :zipcode, :string
    field :particularized_at, Ecto.DateTime
    field :url, :string
    field :photo, Onwipca.Photo.Type
    field :latitude, :float
    field :longitude, :float

    belongs_to :founder, User, foreign_key: :founder_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :street, :city, :state, :zipcode, :particularized_at, :url])
    |> cast_attachments(params, [:photo])
    |> validate_required([:name, :street, :city, :state, :zipcode, :particularized_at, :url])
  end
end
