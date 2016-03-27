defmodule Aquarelle.GalleryTest do
  use Aquarelle.ModelCase

  alias Aquarelle.Gallery

  @valid_attrs %{description: "some content", ordinality: 42, slug: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Gallery.changeset(%Gallery{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Gallery.changeset(%Gallery{}, @invalid_attrs)
    refute changeset.valid?
  end
end
