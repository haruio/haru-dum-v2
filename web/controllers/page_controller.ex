defmodule Dum.PageController do
  use Dum.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
