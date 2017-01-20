defmodule Onwipca.Pathway do
  use Onwipca.Web, :model

  schema "pathways" do
    field :name, :string
    field :readiness, :string
    field :location, :string
    field :training, :string
    field :sender, :string
    field :position, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :readiness, :location, :training, :sender, :position])
    |> validate_required([:name, :readiness, :location, :training, :sender, :position])
  end

  def pathways do
    query = from Onwipca.Pathway, order_by: [:position]
    Onwipca.Repo.all(query)
  end
end
