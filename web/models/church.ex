defmodule Onwipca.Church do
  use Onwipca.Web, :model
  use Arc.Ecto.Schema

  import Onwipca.Locator

  alias Onwipca.User
  alias Onwipca.Pathway

  schema "churches" do
    field :name, :string
    field :contact, :string
    field :street, :string
    field :city, :string
    field :state, :string
    field :zipcode, :string
    field :particularized_at, Ecto.DateTime
    field :url, :string
    field :logo, Onwipca.Photo.Type
    field :latitude, :float
    field :longitude, :float

    belongs_to :founder, User, foreign_key: :founder_id
    belongs_to :pathway, Pathway

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :contact, :founder_id, :pathway_id, :street, :city, :state, :zipcode, :particularized_at, :url])
    |> cast_attachments(params, [:logo])
    |> validate_required([:name])
    |> locate
    |> cast(params, [:latitude, :longitude])
  end
end
