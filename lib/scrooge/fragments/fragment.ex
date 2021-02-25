defmodule Scrooge.Fragments.Fragment do
  # import Ecto.Changeset
  defstruct [:slug, :doc]

  @doc false
  def changeset(fragment, _attrs) do
    fragment
    # |> cast(attrs, [:name, :doc])
    # |> validate_required([:name, :doc])
  end
end
