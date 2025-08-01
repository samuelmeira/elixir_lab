defmodule ElixirLab.Pokemons.Update do
  alias ElixirLab.Repo
  alias ElixirLab.Pokemons.Pokemon

  def run(%{"id" => id} = params) do
    case Repo.get(Pokemon, id) do
      nil -> {:error, "Pokemon not found!"}
      pokemon -> update_pokemon(pokemon, params)
    end
  end

  defp update_pokemon(pokemon, params) do
    pokemon
    |> Pokemon.update_changeset(params)
    |> Repo.update()
  end

end
