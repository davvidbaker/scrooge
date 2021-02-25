defmodule Scrooge.Repo.Migrations.CreateFoobars do
  use Ecto.Migration

  def change do
    create table(:foobars) do
      add :slug, :string
      add :doc, :string
      add :status, :string

      timestamps()
    end

  end
end
