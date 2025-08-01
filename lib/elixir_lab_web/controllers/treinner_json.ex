defmodule ElixirLabWeb.TreinnerJSON do
  alias ElixirLab.Core.Treinner

  @doc """
  Renders a list of treinners.
  """
  def index(%{treinners: treinners}) do
    %{data: for(treinner <- treinners, do: data(treinner))}
  end

  @doc """
  Renders a single treinner.
  """
  def show(%{treinner: treinner}) do
    %{data: data(treinner)}
  end

  defp data(%Treinner{} = treinner) do
    %{
      id: treinner.id,
      name: treinner.name,
      age: treinner.age
    }
  end
end
