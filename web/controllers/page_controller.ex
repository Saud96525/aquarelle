defmodule Aquarelle.PageController do
  use Aquarelle.Web, :controller
  alias Aquarelle.Image

  def index(conn, _params) do
    images = Repo.all(
      Image,
      order_by: [desc: :created],
      limit: 20)
    render(conn, "index.html", images: images)
  end
end
