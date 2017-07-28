defmodule NextWorldIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias GameOfLife.Router

  @opts Router.init([])
  test 'posting empty world' do
    conn = conn(:post, "/worlds/next", %{ live_cells: [] })
    response = Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body == %{ live_cells: [] } |> Poison.encode!
  end
end
