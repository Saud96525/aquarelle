defmodule Aquarelle.GalleryController do
  use Aquarelle.Web, :controller

  alias Aquarelle.Gallery

  plug :scrub_params, "gallery" when action in [:create, :update]

  def index(conn, _params) do
    galleries = Repo.all(Gallery)
    render(conn, "index.html", galleries: galleries)
  end

  def new(conn, _params) do
    changeset = Gallery.changeset(%Gallery{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gallery" => gallery_params}) do
    changeset = Gallery.changeset(%Gallery{}, gallery_params)

    case Repo.insert(changeset) do
      {:ok, _gallery} ->
        conn
        |> put_flash(:info, "Gallery created successfully.")
        |> redirect(to: gallery_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gallery = Repo.get!(Gallery, id)
    render(conn, "show.html", gallery: gallery)
  end

  def edit(conn, %{"id" => id}) do
    gallery = Repo.get!(Gallery, id)
    changeset = Gallery.changeset(gallery)
    render(conn, "edit.html", gallery: gallery, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gallery" => gallery_params}) do
    gallery = Repo.get!(Gallery, id)
    changeset = Gallery.changeset(gallery, gallery_params)

    case Repo.update(changeset) do
      {:ok, gallery} ->
        conn
        |> put_flash(:info, "Gallery updated successfully.")
        |> redirect(to: gallery_path(conn, :show, gallery))
      {:error, changeset} ->
        render(conn, "edit.html", gallery: gallery, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gallery = Repo.get!(Gallery, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(gallery)

    conn
    |> put_flash(:info, "Gallery deleted successfully.")
    |> redirect(to: gallery_path(conn, :index))
  end
end
