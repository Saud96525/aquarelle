defmodule Aquarelle.ImageController do
	require IEx
  use Aquarelle.Web, :controller

  alias Aquarelle.Image
  alias Aquarelly.Gallery

  plug :scrub_params, "image" when action in [:create, :update]

  def index(conn, _params) do
    images = Repo.all(Image)
    render(conn, "index.html", images: images)
  end

  def new(conn, _params) do
    changeset = Image.changeset(%Image{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"image" => image_params}) do
    changeset = Image.changeset(%Image{}, image_params)

    case Repo.insert(changeset) do
      {:ok, _image} ->
        conn
        |> put_flash(:info, "Image created successfully.")
        |> redirect(to: image_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    image = Repo.get!(Image, id)
    render(conn, "show.html", image: image)
  end

  def edit(conn, %{"id" => id}) do
    image = Repo.get!(Image, id)
    changeset = Image.changeset(image)
    render(conn, "edit.html", image: image, changeset: changeset)
  end

  def update(conn, %{"id" => id, "image" => image_params}) do
    image = Repo.get!(Image, id)
    changeset = Image.changeset(image, image_params)

    case Repo.update(changeset) do
      {:ok, image} ->
        conn
        |> put_flash(:info, "Image updated successfully.")
        |> redirect(to: image_path(conn, :show, image))
      {:error, changeset} ->
        render(conn, "edit.html", image: image, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    image = Repo.get!(Image, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(image)

    conn
    |> put_flash(:info, "Image deleted successfully.")
    |> redirect(to: image_path(conn, :index))
  end
end
