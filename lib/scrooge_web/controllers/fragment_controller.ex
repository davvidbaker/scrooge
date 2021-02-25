defmodule ScroogeWeb.FragmentController do
  use ScroogeWeb, :controller

  alias Scrooge.Fragments
  alias Scrooge.Fragments.Fragment

  def index(conn, _params) do
    fragments = Fragments.list_fragments()
    render(conn, "index.html", fragments: fragments)
  end

  def new(conn, _params) do
    changeset = Fragments.change_fragment(%Fragment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"fragment" => fragment_params}) do
    case Fragments.create_fragment(fragment_params) do
      {:ok, fragment} ->
        conn
        |> put_flash(:info, "Fragment created successfully.")
        |> redirect(to: Routes.fragment_path(conn, :show, fragment))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    fragment = Fragments.get_fragment!(id)
    render(conn, "show.html", fragment: fragment)
  end

  def edit(conn, %{"id" => id}) do
    fragment = Fragments.get_fragment!(id)
    changeset = Fragments.change_fragment(fragment)
    render(conn, "edit.html", fragment: fragment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "fragment" => fragment_params}) do
    fragment = Fragments.get_fragment!(id)

    case Fragments.update_fragment(fragment, fragment_params) do
      {:ok, fragment} ->
        conn
        |> put_flash(:info, "Fragment updated successfully.")
        |> redirect(to: Routes.fragment_path(conn, :show, fragment))

      {:error, changeset} ->
        render(conn, "edit.html", fragment: fragment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    fragment = Fragments.get_fragment!(id)
    {:ok, _fragment} = Fragments.delete_fragment(fragment)

    conn
    |> put_flash(:info, "Fragment deleted successfully.")
    |> redirect(to: Routes.fragment_path(conn, :index))
  end
end
