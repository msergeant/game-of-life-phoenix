defmodule World do
  @type t :: %World{ }
  defstruct live_cells: []

  @spec new() :: World.t()
  @spec new(list(list(integer))) :: World.t()
  def new do
    %World{}
  end
  def new(live_cells) do
    %World{ live_cells: live_cells |> Enum.uniq }
  end

  @spec alive?(World, list) :: boolean
  def alive?(world, cell) do
    world |> Map.get(:live_cells) |> Enum.member?(cell)
  end

  @spec to_list(World) :: list
  def to_list(world) do
    world |> Map.get(:live_cells)
  end

  @spec next_iteration(World) :: World
  def next_iteration(world) do
    world
    |> Map.get(:live_cells)
    |> to_be_tested
    |> Enum.reduce([], fn(cell, acc) ->
      cond do
        should_be_alive?(world, cell) -> acc ++ [cell]
        true -> acc
      end
    end)
    |> new
  end

  defp should_be_alive?(world, [x,y]) do
    alive = alive?(world, [x,y])
    count = count_live_neighbors(world, [x,y])
    cond do
      alive && count == 2 -> true
      count == 3 -> true
      true -> false
    end
  end

  defp count_live_neighbors(world, [x,y]) do
    neighbors([x,y])
    |> Enum.reduce(0, fn(cell, acc) ->
      cond do
        alive?(world, cell) -> acc + 1
        true -> acc
      end
    end)
  end

  defp to_be_tested(live_cells) do
    live_cells
    |> Enum.reduce([], fn(e, acc) ->
      acc ++ [e] ++ neighbors(e)
    end)
    |> Enum.uniq
  end

  defp neighbors([x,y]) do
    [
      [x - 1, y - 1], [x - 0, y - 1], [x + 1, y - 1],
      [x - 1, y - 0],                 [x + 1, y - 0],
      [x - 1, y + 1], [x - 0, y + 1], [x + 1, y + 1]
    ]
  end
end
