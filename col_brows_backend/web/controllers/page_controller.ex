defmodule ColBrowsBackend.PageController do
  use ColBrowsBackend.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
