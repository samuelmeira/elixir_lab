defmodule ElixirLab.Repo.Migrations.CreateTreinners do
  use Ecto.Migration

  def change do
    create table(:treinners) do
      add :name, :string
      add :age, :integer
      add :pokemon_id, references(:pokemons, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:treinners, [:pokemon_id])
  end
end
