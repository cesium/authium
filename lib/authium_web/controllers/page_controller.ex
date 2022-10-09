defmodule AuthiumWeb.PageController do
  use AuthiumWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
