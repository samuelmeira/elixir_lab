defmodule ElixirLabWeb.TreinnerController do
  use ElixirLabWeb, :controller

  alias ElixirLab.Core
  alias ElixirLab.Core.Treinner

  action_fallback ElixirLabWeb.FallbackController

  def index(conn, _params) do
    treinners = Core.list_treinners()
    render(conn, :index, treinners: treinners)
  end

  def create(conn, %{"treinner" => treinner_params}) do
    with {:ok, %Treinner{} = treinner} <- Core.create_treinner(treinner_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/treinners/#{treinner}")
      |> render(:show, treinner: treinner)
    end
  end

  def show(conn, %{"id" => id}) do
    treinner = Core.get_treinner!(id)
    render(conn, :show, treinner: treinner)
  end

  def update(conn, %{"id" => id, "treinner" => treinner_params}) do
    treinner = Core.get_treinner!(id)

    with {:ok, %Treinner{} = treinner} <- Core.update_treinner(treinner, treinner_params) do
      render(conn, :show, treinner: treinner)
    end
  end

  def delete(conn, %{"id" => id}) do
    treinner = Core.get_treinner!(id)

    with {:ok, %Treinner{}} <- Core.delete_treinner(treinner) do
      send_resp(conn, :no_content, "")
    end
  end
end
