defmodule Aquarelle.GalleryImageTest do
  use Aquarelle.ModelCase

  alias Aquarelle.GalleryImage

  @valid_attrs %{ordinality: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = GalleryImage.changeset(%GalleryImage{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = GalleryImage.changeset(%GalleryImage{}, @invalid_attrs)
    refute changeset.valid?
  end
end
