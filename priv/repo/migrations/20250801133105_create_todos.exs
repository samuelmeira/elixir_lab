defmodule ElixirLab.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :description, :string
      add :done, :boolean, default: false, null: false
      add :due_date, :date

      timestamps(type: :utc_datetime)
    end
  end
end
