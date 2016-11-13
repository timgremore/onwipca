defmodule Onwipca.Church do
  use Onwipca.Web, :model

  schema "churches" do
    field :name, :string
    field :street, :string
    field :city, :string
    field :state, :string
    field :zipcode, :string
    field :particularized_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :street, :city, :state, :zipcode, :particularized_at])
    |> validate_required([:name, :street, :city, :state, :zipcode, :particularized_at])
  end
end
