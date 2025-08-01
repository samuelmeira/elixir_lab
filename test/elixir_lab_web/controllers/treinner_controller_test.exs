defmodule ElixirLabWeb.TreinnerControllerTest do
  use ElixirLabWeb.ConnCase

  import ElixirLab.CoreFixtures

  alias ElixirLab.Core.Treinner

  @create_attrs %{
    name: "some name",
    age: 42
  }
  @update_attrs %{
    name: "some updated name",
    age: 43
  }
  @invalid_attrs %{name: nil, age: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all treinners", %{conn: conn} do
      conn = get(conn, ~p"/api/treinners")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create treinner" do
    test "renders treinner when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/treinners", treinner: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/treinners/#{id}")

      assert %{
               "id" => ^id,
               "age" => 42,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/treinners", treinner: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update treinner" do
    setup [:create_treinner]

    test "renders treinner when data is valid", %{conn: conn, treinner: %Treinner{id: id} = treinner} do
      conn = put(conn, ~p"/api/treinners/#{treinner}", treinner: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/treinners/#{id}")

      assert %{
               "id" => ^id,
               "age" => 43,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, treinner: treinner} do
      conn = put(conn, ~p"/api/treinners/#{treinner}", treinner: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete treinner" do
    setup [:create_treinner]

    test "deletes chosen treinner", %{conn: conn, treinner: treinner} do
      conn = delete(conn, ~p"/api/treinners/#{treinner}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/treinners/#{treinner}")
      end
    end
  end

  defp create_treinner(_) do
    treinner = treinner_fixture()
    %{treinner: treinner}
  end
end
