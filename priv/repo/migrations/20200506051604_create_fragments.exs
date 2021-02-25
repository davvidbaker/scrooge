defmodule Scrooge.Repo.Migrations.CreateFragments do
  use Ecto.Migration

  def change do
    create table(:fragments) do
      add :name, :string
      add :doc, :string

      timestamps()
    end

  end
end
