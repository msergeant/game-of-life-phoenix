defmodule World do
  @type t :: %World{ }
  defstruct live_cells: []

  @spec new() :: World.t()
  @spec new(list(list(integer))) :: World.t()
  def new do
    %World{}
  end
  def new(live_cells) do
    %World{ live_cells: live_cells |> Enum.map(&List.to_tuple/1) |> Enum.uniq }
  end

  @spec alive?(World, tuple) :: boolean
  def alive?(world, cell) do
    world |> Map.get(:live_cells) |> Enum.member?(cell)
  end
end
