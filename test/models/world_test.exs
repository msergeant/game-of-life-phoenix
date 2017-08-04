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
end
