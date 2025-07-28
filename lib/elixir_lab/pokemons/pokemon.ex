defmodule ElixirLab.Pokemons.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  @required [:name, :types, :weight]

  schema "pokemons" do
    field :name, :string
    field :types, {:array, :string}
    field :weight, :integer

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
  end
end
