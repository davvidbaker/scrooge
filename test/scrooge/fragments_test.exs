defmodule Scrooge.FragmentsTest do
  use Scrooge.DataCase

  alias Scrooge.Fragments

  describe "fragments" do
    alias Scrooge.Fragments.Fragment

    @valid_attrs %{doc: "some doc", name: "some name"}
    @update_attrs %{doc: "some updated doc", name: "some updated name"}
    @invalid_attrs %{doc: nil, name: nil}

    def fragment_fixture(attrs \\ %{}) do
      {:ok, fragment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Fragments.create_fragment()

      fragment
    end

    test "list_fragments/0 returns all fragments" do
      fragment = fragment_fixture()
      assert Fragments.list_fragments() == [fragment]
    end

    test "get_fragment!/1 returns the fragment with given id" do
      fragment = fragment_fixture()
      assert Fragments.get_fragment!(fragment.id) == fragment
    end

    test "create_fragment/1 with valid data creates a fragment" do
      assert {:ok, %Fragment{} = fragment} = Fragments.create_fragment(@valid_attrs)
      assert fragment.doc == "some doc"
      assert fragment.name == "some name"
    end

    test "create_fragment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fragments.create_fragment(@invalid_attrs)
    end

    test "update_fragment/2 with valid data updates the fragment" do
      fragment = fragment_fixture()
      assert {:ok, %Fragment{} = fragment} = Fragments.update_fragment(fragment, @update_attrs)
      assert fragment.doc == "some updated doc"
      assert fragment.name == "some updated name"
    end

    test "update_fragment/2 with invalid data returns error changeset" do
      fragment = fragment_fixture()
      assert {:error, %Ecto.Changeset{}} = Fragments.update_fragment(fragment, @invalid_attrs)
      assert fragment == Fragments.get_fragment!(fragment.id)
    end

    test "delete_fragment/1 deletes the fragment" do
      fragment = fragment_fixture()
      assert {:ok, %Fragment{}} = Fragments.delete_fragment(fragment)
      assert_raise Ecto.NoResultsError, fn -> Fragments.get_fragment!(fragment.id) end
    end

    test "change_fragment/1 returns a fragment changeset" do
      fragment = fragment_fixture()
      assert %Ecto.Changeset{} = Fragments.change_fragment(fragment)
    end
  end

  describe "fragments" do
    alias Scrooge.Fragments.Fragment

    @valid_attrs %{doc: "some doc", slug: "some slug"}
    @update_attrs %{doc: "some updated doc", slug: "some updated slug"}
    @invalid_attrs %{doc: nil, slug: nil}

    def fragment_fixture(attrs \\ %{}) do
      {:ok, fragment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Fragments.create_fragment()

      fragment
    end

    test "list_fragments/0 returns all fragments" do
      fragment = fragment_fixture()
      assert Fragments.list_fragments() == [fragment]
    end

    test "get_fragment!/1 returns the fragment with given id" do
      fragment = fragment_fixture()
      assert Fragments.get_fragment!(fragment.id) == fragment
    end

    test "create_fragment/1 with valid data creates a fragment" do
      assert {:ok, %Fragment{} = fragment} = Fragments.create_fragment(@valid_attrs)
      assert fragment.doc == "some doc"
      assert fragment.slug == "some slug"
    end

    test "create_fragment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fragments.create_fragment(@invalid_attrs)
    end

    test "update_fragment/2 with valid data updates the fragment" do
      fragment = fragment_fixture()
      assert {:ok, %Fragment{} = fragment} = Fragments.update_fragment(fragment, @update_attrs)
      assert fragment.doc == "some updated doc"
      assert fragment.slug == "some updated slug"
    end

    test "update_fragment/2 with invalid data returns error changeset" do
      fragment = fragment_fixture()
      assert {:error, %Ecto.Changeset{}} = Fragments.update_fragment(fragment, @invalid_attrs)
      assert fragment == Fragments.get_fragment!(fragment.id)
    end

    test "delete_fragment/1 deletes the fragment" do
      fragment = fragment_fixture()
      assert {:ok, %Fragment{}} = Fragments.delete_fragment(fragment)
      assert_raise Ecto.NoResultsError, fn -> Fragments.get_fragment!(fragment.id) end
    end

    test "change_fragment/1 returns a fragment changeset" do
      fragment = fragment_fixture()
      assert %Ecto.Changeset{} = Fragments.change_fragment(fragment)
    end
  end
end
