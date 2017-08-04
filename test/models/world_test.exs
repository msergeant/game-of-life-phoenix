defmodule WorldTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @empty_world %World{live_cells: []}

  test "new with no params" do
    assert(World.new == @empty_world)
  end

  test "new with one cell" do
    assert(World.new([[0,0]]) == %World{live_cells: [[0,0]]})
  end

  test "new with multiple cells" do
    assert(World.new([[0,0], [0,1]]) == %World{live_cells: [[0,0], [0,1]]})
  end

  test "new ignores duplicates" do
    assert(World.new([[0,0], [0,0]]) == %World{live_cells: [[0,0]]})
  end

  test "alive returns false" do
    world = World.new([[0,0], [0,1]])
    assert(World.alive?(world, [0,7]) == false)
  end

  test "alive returns true" do
    world = World.new([[0,0], [0,1]])
    assert(World.alive?(world, [0,1]) == true)
  end

  test "to_list converts to list" do
    list = [[0,0], [0,1]]
    world = World.new(list)
    assert(World.to_list(world) == list)
  end

  test "next_iteration returns empty world" do
    next_world = World.new |> World.next_iteration

    assert(next_world == @empty_world)
  end

  test "next_iteration returns proper live cell list for 10 cell row" do
    initial_points = [
      [7,0], [7,1], [7,2], [7,3], [7,4], [7,5], [7,6], [7,7], [7,8], [7,9]
    ]
    next_world = World.new(initial_points) |> World.next_iteration

    expected_points = [
      [6, 1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7], [6,8],
      [7, 1], [7,2], [7,3], [7,4], [7,5], [7,6], [7,7], [7,8],
      [8, 1], [8,2], [8,3], [8,4], [8,5], [8,6], [8,7], [8,8]
    ]

    result_points = next_world |> World.to_list
    assert(result_points |> Enum.count == expected_points |> Enum.count)
    assert(expected_points |> Enum.all?(fn(p) -> World.alive?(next_world, p) end))
  end
end
