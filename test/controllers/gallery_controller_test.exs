defmodule Aquarelle.GalleryControllerTest do
  use Aquarelle.ConnCase

  alias Aquarelle.Gallery
  @valid_attrs %{description: "some content", ordinality: 42, slug: "some content", title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, gallery_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing galleries"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, gallery_path(conn, :new)
    assert html_response(conn, 200) =~ "New gallery"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, gallery_path(conn, :create), gallery: @valid_attrs
    assert redirected_to(conn) == gallery_path(conn, :index)
    assert Repo.get_by(Gallery, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, gallery_path(conn, :create), gallery: @invalid_attrs
    assert html_response(conn, 200) =~ "New gallery"
  end

  test "shows chosen resource", %{conn: conn} do
    gallery = Repo.insert! %Gallery{}
    conn = get conn, gallery_path(conn, :show, gallery)
    assert html_response(conn, 200) =~ "Show gallery"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, gallery_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    gallery = Repo.insert! %Gallery{}
    conn = get conn, gallery_path(conn, :edit, gallery)
    assert html_response(conn, 200) =~ "Edit gallery"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    gallery = Repo.insert! %Gallery{}
    conn = put conn, gallery_path(conn, :update, gallery), gallery: @valid_attrs
    assert redirected_to(conn) == gallery_path(conn, :show, gallery)
    assert Repo.get_by(Gallery, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    gallery = Repo.insert! %Gallery{}
    conn = put conn, gallery_path(conn, :update, gallery), gallery: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit gallery"
  end

  test "deletes chosen resource", %{conn: conn} do
    gallery = Repo.insert! %Gallery{}
    conn = delete conn, gallery_path(conn, :delete, gallery)
    assert redirected_to(conn) == gallery_path(conn, :index)
    refute Repo.get(Gallery, gallery.id)
  end
end
