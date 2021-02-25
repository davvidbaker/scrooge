defmodule Scrooge.Fragments do
  @moduledoc """
  The Fragments context.
  """

  # import Ecto.Query, warn: false
  alias Scrooge.Repo

  alias Scrooge.Fragments.Fragment

  def save_location do
    Path.expand("./data")
  end

  def save_location(slug) do
    Path.join(save_location(), slug)
  end

  @doc """
  Returns the list of fragments.

  ## Examples

      iex> list_fragments()
      [%Fragment{}, ...]

  """
  def list_fragments() do
    # Repo.all(Fragment)
    # instead of using ecto, just reading from file system
    Path.wildcard(Path.join(save_location(), "*.json"))
  end

  @doc """
  Gets a single fragment.

  Raises `Ecto.NoResultsError` if the Fragment does not exist.

  ## Examples

      iex> get_fragment!(123)
      %Fragment{}

      iex> get_fragment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fragment!(slug) do
    # do: Repo.get!(Fragment, id)
    save_location(slug) |> File.read!()
  end

  @doc """
  Creates a fragment.

  ## Examples

      iex> create_fragment(%{field: value})
      {:ok, %Fragment{}}

      iex> create_fragment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fragment(attrs \\ %{}) do
    %Fragment{}
    |> Fragment.changeset(attrs)
    # |> Repo.insert()
    |> write_fragment()
  end

  def write_fragment(%Fragment{} = fragment) do
    File.write(save_location(fragment.slug), fragment.doc)
  end

  @doc """
  Updates a fragment.

  ## Examples

      iex> update_fragment(fragment, %{field: new_value})
      {:ok, %Fragment{}}

      iex> update_fragment(fragment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fragment(%Fragment{} = fragment, attrs) do
    fragment
    |> Fragment.changeset(attrs)
    |> write_fragment()

    # |> Repo.update()
  end

  @doc """
  Deletes a fragment.

  ## Examples

      iex> delete_fragment(fragment)
      {:ok, %Fragment{}}

      iex> delete_fragment(fragment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fragment(%Fragment{} = fragment) do
    File.rm(Path.join(save_location(), fragment.slug))
    # Repo.delete(fragment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fragment changes.

  ## Examples

      iex> change_fragment(fragment)
      %Ecto.Changeset{data: %Fragment{}}

  """
  def change_fragment(%Fragment{} = fragment, attrs \\ %{}) do
    Fragment.changeset(fragment, attrs)
  end

  alias Scrooge.Fragments.Fragment

  @doc """
  Returns the list of fragments.

  ## Examples

      iex> list_fragments()
      [%Fragment{}, ...]

  """
  def list_fragments do
    raise "TODO"
  end

  @doc """
  Gets a single fragment.

  Raises if the Fragment does not exist.

  ## Examples

      iex> get_fragment!(123)
      %Fragment{}

  """
  def get_fragment!(id), do: raise("TODO")
end
