defmodule GameOfLife.WorldIterationController do
  use GameOfLife.Web, :controller

  def next(conn, _params) do
    render conn, live_cells: []
  end
end
