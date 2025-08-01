defmodule ElixirLabWeb.PokemonController do
  use ElixirLabWeb, :controller

  alias VIEW2JSON
  # REST API Index - Lista tudo; Show - Um unico registro, POST, UPDATE DELETE
  def index(conn, _params) do
    pokemons = ElixirLab.list_pokemons()

    conn
    |> render("index.json", %{pokemons: pokemons})
  end
end
