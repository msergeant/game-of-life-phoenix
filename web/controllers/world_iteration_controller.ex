defmodule GameOfLife.WorldIterationController do
  use GameOfLife.Web, :controller

  def next(conn, params) do
    next_world = params
    |> Map.get("live_cells")
    |> World.new
    |> World.to_list

    render conn, live_cells: next_world
  end
end
