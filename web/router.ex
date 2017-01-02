defmodule Onwipca.Router do
  use Onwipca.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Onwipca do
    pipe_through :api

    resources "/churches", ChurchController, only: [:index]
  end

  scope "/", Onwipca do
    pipe_through [:browser, :browser_auth]

    get "/", PageController, :index
    get "/login", SessionController, :new
    get "/logout", SessionController, :destroy

    resources "/login", SessionController, only: [:create]
    resources "/my-account", UserController, only: [:show], singleton: true
  end
end
