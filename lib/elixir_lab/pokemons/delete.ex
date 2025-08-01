defmodule ElixirLab.Pokemons.Delete do
  alias ElixirLab.Repo
  alias ElixirLab.Pokemons.Pokemon

  def run(id) do
    case Repo.get(Pokemon, id) do
      nil -> {:error, "Pokemon not found!"}
      pokemon -> delete_pokemon(pokemon)
    end
  end

  def delete_pokemon(pokemon) do
    Repo.delete(pokemon)
  end
end
