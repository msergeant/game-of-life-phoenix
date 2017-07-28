defmodule NextWorldIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias GameOfLife.Router

  @opts Router.init([])
  test 'posting empty world' do
    conn = conn(:get, "/worlds/next")
    response = Router.call(conn, @opts)
    assert response.status == 200
  end
end
