defmodule ScroogeWeb.FoobarController do
  use ScroogeWeb, :controller

  alias Scrooge.Foobars
  alias Scrooge.Foobars.Foobar

  action_fallback ScroogeWeb.FallbackController

  def index(conn, _params) do
    foobars = Foobars.list_foobars()
    render(conn, "index.json", foobars: foobars)
  end

  def create(conn, %{"foobar" => foobar_params}) do
    with {:ok, %Foobar{} = foobar} <- Foobars.create_foobar(foobar_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.foobar_path(conn, :show, foobar))
      |> render("show.json", foobar: foobar)
    end
  end

  def show(conn, %{"id" => id}) do
    foobar = Foobars.get_foobar!(id)
    render(conn, "show.json", foobar: foobar)
  end

  def update(conn, %{"id" => id, "foobar" => foobar_params}) do
    foobar = Foobars.get_foobar!(id)

    with {:ok, %Foobar{} = foobar} <- Foobars.update_foobar(foobar, foobar_params) do
      render(conn, "show.json", foobar: foobar)
    end
  end

  def delete(conn, %{"id" => id}) do
    foobar = Foobars.get_foobar!(id)

    with {:ok, %Foobar{}} <- Foobars.delete_foobar(foobar) do
      send_resp(conn, :no_content, "")
    end
  end
end
