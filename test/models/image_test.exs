defmodule Aquarelle.ImageTest do
  use Aquarelle.ModelCase

  alias Aquarelle.Image

  @valid_attrs %{created: "2010-04-17 14:00:00", description: "some content",
								 extension: "some content", key: "some content",
								 medium: "some content", slug: "test", title: "some content"}
  @invalid_attrs %{key: nil, title: nil}

  test "changeset with valid attributes" do
    changeset = Image.changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Image.changeset(%Image{}, @invalid_attrs)
    refute changeset.valid?
  end

	test "title_to_slug" do
		assert Image.title_to_slug({"blah", "FOO"}) == "foo"
	end
end
