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
    |> change(particularized_at: date_to_datetime(params["particularized_at"]))
    |> cast(params, [:name, :contact, :founder_id, :pathway_id, :street, :city, :state, :zipcode, :url])
    |> cast_attachments(params, [:logo])
    |> validate_required([:name])
    |> locate
    |> cast(params, [:latitude, :longitude])
  end

  @doc """
  We are only concerned with dates for now and choosing to append time information
  """
  def date_to_datetime(date) do
    if is_nil(date) do
      nil
    else
      {:ok, ecto_date}     = Ecto.Date.cast(date)
      {:ok, ecto_datetime} = Ecto.DateTime.from_date(ecto_date)
                             |> Ecto.DateTime.cast
      ecto_datetime
    end
  end
end
