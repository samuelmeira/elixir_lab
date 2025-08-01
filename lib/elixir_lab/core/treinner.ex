defmodule ElixirLab.Core.Treinner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "treinners" do
    field :name, :string
    field :age, :integer
    field :pokemon_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(treinner, attrs) do
    treinner
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
