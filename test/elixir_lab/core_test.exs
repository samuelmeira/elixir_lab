defmodule ElixirLab.CoreTest do
  use ElixirLab.DataCase

  alias ElixirLab.Core

  describe "treinners" do
    alias ElixirLab.Core.Treinner

    import ElixirLab.CoreFixtures

    @invalid_attrs %{name: nil, age: nil}

    test "list_treinners/0 returns all treinners" do
      treinner = treinner_fixture()
      assert Core.list_treinners() == [treinner]
    end

    test "get_treinner!/1 returns the treinner with given id" do
      treinner = treinner_fixture()
      assert Core.get_treinner!(treinner.id) == treinner
    end

    test "create_treinner/1 with valid data creates a treinner" do
      valid_attrs = %{name: "some name", age: 42}

      assert {:ok, %Treinner{} = treinner} = Core.create_treinner(valid_attrs)
      assert treinner.name == "some name"
      assert treinner.age == 42
    end

    test "create_treinner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_treinner(@invalid_attrs)
    end

    test "update_treinner/2 with valid data updates the treinner" do
      treinner = treinner_fixture()
      update_attrs = %{name: "some updated name", age: 43}

      assert {:ok, %Treinner{} = treinner} = Core.update_treinner(treinner, update_attrs)
      assert treinner.name == "some updated name"
      assert treinner.age == 43
    end

    test "update_treinner/2 with invalid data returns error changeset" do
      treinner = treinner_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_treinner(treinner, @invalid_attrs)
      assert treinner == Core.get_treinner!(treinner.id)
    end

    test "delete_treinner/1 deletes the treinner" do
      treinner = treinner_fixture()
      assert {:ok, %Treinner{}} = Core.delete_treinner(treinner)
      assert_raise Ecto.NoResultsError, fn -> Core.get_treinner!(treinner.id) end
    end

    test "change_treinner/1 returns a treinner changeset" do
      treinner = treinner_fixture()
      assert %Ecto.Changeset{} = Core.change_treinner(treinner)
    end
  end

  describe "todos" do
    alias ElixirLab.Core.Todo

    import ElixirLab.CoreFixtures

    @invalid_attrs %{done: nil, description: nil, due_date: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Core.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Core.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{done: true, description: "some description", due_date: ~D[2025-07-31]}

      assert {:ok, %Todo{} = todo} = Core.create_todo(valid_attrs)
      assert todo.done == true
      assert todo.description == "some description"
      assert todo.due_date == ~D[2025-07-31]
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{done: false, description: "some updated description", due_date: ~D[2025-08-01]}

      assert {:ok, %Todo{} = todo} = Core.update_todo(todo, update_attrs)
      assert todo.done == false
      assert todo.description == "some updated description"
      assert todo.due_date == ~D[2025-08-01]
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_todo(todo, @invalid_attrs)
      assert todo == Core.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Core.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Core.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Core.change_todo(todo)
    end
  end
end
