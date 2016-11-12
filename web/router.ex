defmodule OnWiPca.Router do
  use OnWiPca.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Openmaize.Authenticate
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OnWiPca do
    pipe_through :api

    resources "/churches", ChurchController, only: [:index]
  end

  scope "/", OnWiPca do
    pipe_through :browser

    get "/", PageController, :index

    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

end
