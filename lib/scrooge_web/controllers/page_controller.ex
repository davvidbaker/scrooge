defmodule ScroogeWeb.PageController do
  use ScroogeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
