defmodule Dum.UrlController do
  use Dum.Web, :controller
  use Amnesia
  use Database


  def index(conn, _params) do
      Amnesia.transaction do
        # The simplest way to read a record is using the key of the record (by
        # default the first attribute)
        #
        # Since we wrote the John, Richard and Linus in this order and the id is
        # defined as *autoincrement*, the first `User` will be John.
        req = Request.read(1)

        req |> IO.inspect
        json conn, %{success: req}
      end
  end

  def show(conn, %{"id" => id}) do
    Amnesia.transaction do
      {numid, _} = Integer.parse(id)
      request = Request.read(numid)
      json conn, %{success: request}
    end
  end

  def create(conn, _params) do
    Amnesia.transaction do
        %Request{url: "/test", header: "header", body: "body"} |> Request.write
    end
    json conn, %{success: :create}
  end

  def edit(conn, %{"id" => id}) do
    Amnesia.transaction do
       request = Request.read(id)
       json conn, %{success: request}
    end
  end

  def delete(conn, %{"id" => id}) do
    Amnesia.transaction do
      {numid, _} = Integer.parse(id)
      Request.delete(numid)
    end

    json conn, %{success: :delete}
  end

end