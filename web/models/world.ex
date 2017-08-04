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
    #|> Map.get(:live_cells) |>  Enum.map(&Tuple.to_list/1)
  end
end
