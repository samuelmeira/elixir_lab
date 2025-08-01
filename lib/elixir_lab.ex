defmodule ElixirLab do
  @moduledoc """
  ElixirLab keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias ElixirLab.Pokemons.{Create, List, Get, Update, Delete}


  defdelegate create_pokemon(params), to: Create, as: :run
  # Read Update delete
  defdelegate list_pokemons(), to: List, as: :run
  defdelegate get_pokemon(id), to: Get, as: :run
  defdelegate update_pokemon(params), to: Update, as: :run
  defdelegate delete_pokemon(id), to: Delete, as: :run
end
