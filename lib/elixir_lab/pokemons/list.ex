defmodule ElixirLab.Pokemons.List do
  alias ElixirLab.Pokemons.Pokemon
  alias ElixirLab.Repo

  def run() do
    Pokemon
    |> Repo.all()
  end
end
