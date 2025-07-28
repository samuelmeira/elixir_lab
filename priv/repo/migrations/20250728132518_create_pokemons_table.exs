defmodule ElixirLab.Repo.Migrations.CreatePokemonsTable do
  use Ecto.Migration

  def change do
    create table(:pokemons ) do
      add :name, :string
      add :types, {:array, :string}
      add :weight, :integer

      timestamps()
    end
  end
end
