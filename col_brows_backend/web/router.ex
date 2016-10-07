defmodule ColBrowsBackend.Router do
  use ColBrowsBackend.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ColBrowsBackend do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/webpage/:id", WebpageController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", ColBrowsBackend do
  #   pipe_through :api
  # end
end
