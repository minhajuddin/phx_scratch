defmodule PhxScratch.Web.PageController do
  use PhxScratch.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
