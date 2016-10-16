use Amnesia

defdatabase Database do
    deftable Request, [{ :id, autoincrement }, :url, :header, :body], type: :ordered_set, index: [:url  ] do
        # this isn't required, but it's always nice to spec things
        @type t :: %Request{id: non_neg_integer, url: String.t, header: String.t, body: String.t}

        # this defines a helper function to fetch the user from a Message record
        def request(self) do
          Request.read(self.id)
        end

        # this does the same, but uses dirty operations
        def request!(self) do
          Request.read!(self.id)
        end

        def add_request(self, url, header, body) do
          %Request{id: self.id, url: url, header: header, body: body} |> Request.write
        end

        def add_request!(self, url, header, body) do
          %Request{id: self.id, url: url, header: header, body: body} |> Request.write!
        end


    end

end