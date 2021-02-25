defmodule Scrooge.Foobars do
  @moduledoc """
  The Foobars context.
  """

  import Ecto.Query, warn: false
  alias Scrooge.Repo

  alias Scrooge.Foobars.Foobar

  @doc """
  Returns the list of foobars.

  ## Examples

      iex> list_foobars()
      [%Foobar{}, ...]

  """
  def list_foobars do
    Repo.all(Foobar)
  end

  @doc """
  Gets a single foobar.

  Raises `Ecto.NoResultsError` if the Foobar does not exist.

  ## Examples

      iex> get_foobar!(123)
      %Foobar{}

      iex> get_foobar!(456)
      ** (Ecto.NoResultsError)

  """
  def get_foobar!(id), do: Repo.get!(Foobar, id)

  @doc """
  Creates a foobar.

  ## Examples

      iex> create_foobar(%{field: value})
      {:ok, %Foobar{}}

      iex> create_foobar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_foobar(attrs \\ %{}) do
    %Foobar{}
    |> Foobar.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a foobar.

  ## Examples

      iex> update_foobar(foobar, %{field: new_value})
      {:ok, %Foobar{}}

      iex> update_foobar(foobar, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_foobar(%Foobar{} = foobar, attrs) do
    foobar
    |> Foobar.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a foobar.

  ## Examples

      iex> delete_foobar(foobar)
      {:ok, %Foobar{}}

      iex> delete_foobar(foobar)
      {:error, %Ecto.Changeset{}}

  """
  def delete_foobar(%Foobar{} = foobar) do
    Repo.delete(foobar)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking foobar changes.

  ## Examples

      iex> change_foobar(foobar)
      %Ecto.Changeset{data: %Foobar{}}

  """
  def change_foobar(%Foobar{} = foobar, attrs \\ %{}) do
    Foobar.changeset(foobar, attrs)
  end
end
