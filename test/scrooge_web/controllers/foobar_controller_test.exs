defmodule ScroogeWeb.FoobarControllerTest do
  use ScroogeWeb.ConnCase

  alias Scrooge.Foobars
  alias Scrooge.Foobars.Foobar

  @create_attrs %{
    doc: "some doc",
    slug: "some slug",
    status: "some status"
  }
  @update_attrs %{
    doc: "some updated doc",
    slug: "some updated slug",
    status: "some updated status"
  }
  @invalid_attrs %{doc: nil, slug: nil, status: nil}

  def fixture(:foobar) do
    {:ok, foobar} = Foobars.create_foobar(@create_attrs)
    foobar
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all foobars", %{conn: conn} do
      conn = get(conn, Routes.foobar_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create foobar" do
    test "renders foobar when data is valid", %{conn: conn} do
      conn = post(conn, Routes.foobar_path(conn, :create), foobar: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.foobar_path(conn, :show, id))

      assert %{
               "id" => id,
               "doc" => "some doc",
               "slug" => "some slug",
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.foobar_path(conn, :create), foobar: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update foobar" do
    setup [:create_foobar]

    test "renders foobar when data is valid", %{conn: conn, foobar: %Foobar{id: id} = foobar} do
      conn = put(conn, Routes.foobar_path(conn, :update, foobar), foobar: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.foobar_path(conn, :show, id))

      assert %{
               "id" => id,
               "doc" => "some updated doc",
               "slug" => "some updated slug",
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, foobar: foobar} do
      conn = put(conn, Routes.foobar_path(conn, :update, foobar), foobar: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete foobar" do
    setup [:create_foobar]

    test "deletes chosen foobar", %{conn: conn, foobar: foobar} do
      conn = delete(conn, Routes.foobar_path(conn, :delete, foobar))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.foobar_path(conn, :show, foobar))
      end
    end
  end

  defp create_foobar(_) do
    foobar = fixture(:foobar)
    %{foobar: foobar}
  end
end
