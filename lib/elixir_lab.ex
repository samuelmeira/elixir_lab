defmodule ElixirLab do
  @moduledoc """
  ElixirLab keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias ElixirLab.Pokemons.Pokemon
  alias ElixirLab.Repo

  def create_pokemon(params) do
    params
    |> Pokemon.changeset()
    |> Repo.insert()
  end


end
