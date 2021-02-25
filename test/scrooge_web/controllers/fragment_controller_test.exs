defmodule ScroogeWeb.FragmentControllerTest do
  use ScroogeWeb.ConnCase

  alias Scrooge.Fragments

  @create_attrs %{doc: "some doc", slug: "some slug"}
  @update_attrs %{doc: "some updated doc", slug: "some updated slug"}
  @invalid_attrs %{doc: nil, slug: nil}

  def fixture(:fragment) do
    {:ok, fragment} = Fragments.create_fragment(@create_attrs)
    fragment
  end

  describe "index" do
    test "lists all fragments", %{conn: conn} do
      conn = get(conn, Routes.fragment_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Fragments"
    end
  end

  describe "new fragment" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.fragment_path(conn, :new))
      assert html_response(conn, 200) =~ "New Fragment"
    end
  end

  describe "create fragment" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.fragment_path(conn, :create), fragment: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.fragment_path(conn, :show, id)

      conn = get(conn, Routes.fragment_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Fragment"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.fragment_path(conn, :create), fragment: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Fragment"
    end
  end

  describe "edit fragment" do
    setup [:create_fragment]

    test "renders form for editing chosen fragment", %{conn: conn, fragment: fragment} do
      conn = get(conn, Routes.fragment_path(conn, :edit, fragment))
      assert html_response(conn, 200) =~ "Edit Fragment"
    end
  end

  describe "update fragment" do
    setup [:create_fragment]

    test "redirects when data is valid", %{conn: conn, fragment: fragment} do
      conn = put(conn, Routes.fragment_path(conn, :update, fragment), fragment: @update_attrs)
      assert redirected_to(conn) == Routes.fragment_path(conn, :show, fragment)

      conn = get(conn, Routes.fragment_path(conn, :show, fragment))
      assert html_response(conn, 200) =~ "some updated doc"
    end

    test "renders errors when data is invalid", %{conn: conn, fragment: fragment} do
      conn = put(conn, Routes.fragment_path(conn, :update, fragment), fragment: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Fragment"
    end
  end

  describe "delete fragment" do
    setup [:create_fragment]

    test "deletes chosen fragment", %{conn: conn, fragment: fragment} do
      conn = delete(conn, Routes.fragment_path(conn, :delete, fragment))
      assert redirected_to(conn) == Routes.fragment_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.fragment_path(conn, :show, fragment))
      end
    end
  end

  defp create_fragment(_) do
    fragment = fixture(:fragment)
    %{fragment: fragment}
  end
end
