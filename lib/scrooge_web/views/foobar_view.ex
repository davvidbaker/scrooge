defmodule ScroogeWeb.FoobarView do
  use ScroogeWeb, :view
  alias ScroogeWeb.FoobarView

  def render("index.json", %{foobars: foobars}) do
    %{data: render_many(foobars, FoobarView, "foobar.json")}
  end

  def render("show.json", %{foobar: foobar}) do
    %{data: render_one(foobar, FoobarView, "foobar.json")}
  end

  def render("foobar.json", %{foobar: foobar}) do
    %{id: foobar.id,
      slug: foobar.slug,
      doc: foobar.doc,
      status: foobar.status}
  end
end
