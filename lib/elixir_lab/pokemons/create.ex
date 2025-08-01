defmodule ElixirLab.Pokemons.Create do
  alias ElixirLab.Repo
  alias ElixirLab.Pokemons.Pokemon

  def run(params) do
    params
    |> create_pokemon()
  end

  defp create_pokemon(params) do
    params
    |> Pokemon.changeset()
    |> Repo.insert()
  end
end
