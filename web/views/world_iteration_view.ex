defmodule GameOfLife.WorldIterationView do
  use GameOfLife.Web, :view

  def render("next.json", %{live_cells: live_cells}) do
    %{live_cells: live_cells}
  end
end
