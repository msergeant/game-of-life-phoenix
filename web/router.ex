defmodule GameOfLife.Router do
  use GameOfLife.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GameOfLife do
    pipe_through :api

    get "/worlds/next", WorldIterationController, :next
  end
end
