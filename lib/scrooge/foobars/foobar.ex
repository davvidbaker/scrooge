defmodule Scrooge.Foobars.Foobar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "foobars" do
    field :doc, :string
    field :slug, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(foobar, attrs) do
    foobar
    |> cast(attrs, [:slug, :doc, :status])
    |> validate_required([:slug, :doc, :status])
  end
end
