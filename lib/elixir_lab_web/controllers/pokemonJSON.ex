defmodule ElixirLabWeb.PokemonJSON do
  def render("index.json", %{pokemons: pokemons}) do
    Enum.map(pokemons, fn pokemon ->
      %{
        id: pokemon.id,
        name: pokemon.name,
        types: pokemon.types,
        weight: pokemon.weight
      }
    end)
  end
end
