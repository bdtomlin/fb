defmodule Fb.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger
  plug(Plug.Logger, log: :debug)

  plug(:match)

  plug(:dispatch)

  get "/form" do
    send_resp(conn, 200, ~s|
    <html>
    <body>
    <form method="post" action="/result">
      <button name="btn" value="a">a</button>
      <button name="btn" value="b">b</button>
    </form>
    </body>
    </html>
    |)
  end

  post "/result" do
    {:ok, body, conn} = read_body(conn)

    IO.inspect(body)

    send_resp(conn, 201, ~s|
      <html>
      <body>
        #{body}
      </body>
      </html>
    |)
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
