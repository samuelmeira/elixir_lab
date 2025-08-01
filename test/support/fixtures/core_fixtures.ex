defmodule ElixirLab.CoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirLab.Core` context.
  """

  @doc """
  Generate a treinner.
  """
  def treinner_fixture(attrs \\ %{}) do
    {:ok, treinner} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> ElixirLab.Core.create_treinner()

    treinner
  end

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        description: "some description",
        done: true,
        due_date: ~D[2025-07-31]
      })
      |> ElixirLab.Core.create_todo()

    todo
  end
end
