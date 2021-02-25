defmodule Scrooge.FoobarsTest do
  use Scrooge.DataCase

  alias Scrooge.Foobars

  describe "foobars" do
    alias Scrooge.Foobars.Foobar

    @valid_attrs %{doc: "some doc", slug: "some slug", status: "some status"}
    @update_attrs %{doc: "some updated doc", slug: "some updated slug", status: "some updated status"}
    @invalid_attrs %{doc: nil, slug: nil, status: nil}

    def foobar_fixture(attrs \\ %{}) do
      {:ok, foobar} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Foobars.create_foobar()

      foobar
    end

    test "list_foobars/0 returns all foobars" do
      foobar = foobar_fixture()
      assert Foobars.list_foobars() == [foobar]
    end

    test "get_foobar!/1 returns the foobar with given id" do
      foobar = foobar_fixture()
      assert Foobars.get_foobar!(foobar.id) == foobar
    end

    test "create_foobar/1 with valid data creates a foobar" do
      assert {:ok, %Foobar{} = foobar} = Foobars.create_foobar(@valid_attrs)
      assert foobar.doc == "some doc"
      assert foobar.slug == "some slug"
      assert foobar.status == "some status"
    end

    test "create_foobar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Foobars.create_foobar(@invalid_attrs)
    end

    test "update_foobar/2 with valid data updates the foobar" do
      foobar = foobar_fixture()
      assert {:ok, %Foobar{} = foobar} = Foobars.update_foobar(foobar, @update_attrs)
      assert foobar.doc == "some updated doc"
      assert foobar.slug == "some updated slug"
      assert foobar.status == "some updated status"
    end

    test "update_foobar/2 with invalid data returns error changeset" do
      foobar = foobar_fixture()
      assert {:error, %Ecto.Changeset{}} = Foobars.update_foobar(foobar, @invalid_attrs)
      assert foobar == Foobars.get_foobar!(foobar.id)
    end

    test "delete_foobar/1 deletes the foobar" do
      foobar = foobar_fixture()
      assert {:ok, %Foobar{}} = Foobars.delete_foobar(foobar)
      assert_raise Ecto.NoResultsError, fn -> Foobars.get_foobar!(foobar.id) end
    end

    test "change_foobar/1 returns a foobar changeset" do
      foobar = foobar_fixture()
      assert %Ecto.Changeset{} = Foobars.change_foobar(foobar)
    end
  end
end
