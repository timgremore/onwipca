defmodule Onwipca.Pathway do
  use Onwipca.Web, :model

  schema "pathways" do
    field :name, :string
    field :readiness, :string
    field :location, :string
    field :training, :string
    field :sender, :string
    field :position, :integer

    has_many :churches, Onwipca.Church

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

  def church_count(pathway) do
    pathway_id = pathway.id
    query = from c in Onwipca.Church, where: c.pathway_id == ^pathway_id
    Onwipca.Repo.aggregate(query, :count, :id)
  end
end
