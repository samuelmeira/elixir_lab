defmodule ElixirLab.Core do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  alias ElixirLab.Repo

  alias ElixirLab.Core.Treinner

  @doc """
  Returns the list of treinners.

  ## Examples

      iex> list_treinners()
      [%Treinner{}, ...]

  """
  def list_treinners do
    Repo.all(Treinner)
  end

  @doc """
  Gets a single treinner.

  Raises `Ecto.NoResultsError` if the Treinner does not exist.

  ## Examples

      iex> get_treinner!(123)
      %Treinner{}

      iex> get_treinner!(456)
      ** (Ecto.NoResultsError)

  """
  def get_treinner!(id), do: Repo.get!(Treinner, id)

  @doc """
  Creates a treinner.

  ## Examples

      iex> create_treinner(%{field: value})
      {:ok, %Treinner{}}

      iex> create_treinner(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_treinner(attrs \\ %{}) do
    %Treinner{}
    |> Treinner.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a treinner.

  ## Examples

      iex> update_treinner(treinner, %{field: new_value})
      {:ok, %Treinner{}}

      iex> update_treinner(treinner, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_treinner(%Treinner{} = treinner, attrs) do
    treinner
    |> Treinner.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a treinner.

  ## Examples

      iex> delete_treinner(treinner)
      {:ok, %Treinner{}}

      iex> delete_treinner(treinner)
      {:error, %Ecto.Changeset{}}

  """
  def delete_treinner(%Treinner{} = treinner) do
    Repo.delete(treinner)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking treinner changes.

  ## Examples

      iex> change_treinner(treinner)
      %Ecto.Changeset{data: %Treinner{}}

  """
  def change_treinner(%Treinner{} = treinner, attrs \\ %{}) do
    Treinner.changeset(treinner, attrs)
  end

  alias ElixirLab.Core.Todo

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%Todo{}, ...]

  """
  def list_todos do
    Repo.all(Todo)
  end

  @doc """
  Gets a single todo.

  Raises `Ecto.NoResultsError` if the Todo does not exist.

  ## Examples

      iex> get_todo!(123)
      %Todo{}

      iex> get_todo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo!(id), do: Repo.get!(Todo, id)

  @doc """
  Creates a todo.

  ## Examples

      iex> create_todo(%{field: value})
      {:ok, %Todo{}}

      iex> create_todo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo(attrs \\ %{}) do
    %Todo{}
    |> Todo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todo.

  ## Examples

      iex> update_todo(todo, %{field: new_value})
      {:ok, %Todo{}}

      iex> update_todo(todo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo(%Todo{} = todo, attrs) do
    todo
    |> Todo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a todo.

  ## Examples

      iex> delete_todo(todo)
      {:ok, %Todo{}}

      iex> delete_todo(todo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo(%Todo{} = todo) do
    Repo.delete(todo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo changes.

  ## Examples

      iex> change_todo(todo)
      %Ecto.Changeset{data: %Todo{}}

  """
  def change_todo(%Todo{} = todo, attrs \\ %{}) do
    Todo.changeset(todo, attrs)
  end
end
