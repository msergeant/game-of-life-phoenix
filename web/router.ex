defmodule GameOfLife.Router do
  use GameOfLife.Web, :router

  pipeline :api do
    plug CORSPlug, [origin: "http://localhost:4000"]
    plug :accepts, ["json"]
  end

  scope "/", GameOfLife do
    pipe_through :api

    post "/worlds/next", WorldIterationController, :next
    options "/worlds/next", WorldIterationController, :options
  end
end
