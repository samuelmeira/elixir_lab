defmodule ElixirLab.Pokemons.Get do
  alias ElixirLab.Repo
  alias ElixirLab.Pokemons.Pokemon

  def run(id) do
    Pokemon
    |> Repo.get(id)
  end
end
