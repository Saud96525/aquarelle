defmodule Aquarelle.PageController do
  use Aquarelle.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
