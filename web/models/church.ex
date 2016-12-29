defmodule Onwipca.Church do
  use Onwipca.Web, :model
  use Arc.Ecto.Schema

  import Onwipca.Locator

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
    field :stage, :integer, default: 1

    belongs_to :founder, User, foreign_key: :founder_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :street, :city, :state, :zipcode, :particularized_at, :url, :stage])
    |> cast_attachments(params, [:photo])
    |> validate_required([:name, :street, :city, :state, :zipcode, :particularized_at, :url])
    |> locate
  end

  def current_stage(church) do
    case church.stage do
      1 -> :new
      2 -> :pathway_three
      3 -> :pathway_two
      4 -> :pathway_one
      5 -> :particularized
      _ -> :unknown
    end
  end

  def next_stage(church) do
    case church.stage do
      4 ->
        changeset(church, %{stage: 5, particularized_at: Ecto.DateTime.utc})
        |> Onwipca.Repo.update
      _ ->
        changeset(church, %{stage: church.stage + 1})
        |> Onwipca.Repo.update
    end
  end
end
