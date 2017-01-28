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
    plug Onwipca.Plug.CurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Onwipca, as: :api do
    pipe_through :api

    resources "/churches", Api.ChurchController, only: [:index]
    resources "/pathways", Api.PathwayController, only: [:index]
  end

  scope "/", Onwipca do
    pipe_through [:browser, :browser_auth]

    get "/", PageController, :index
    get "/login", SessionController, :new
    get "/logout", SessionController, :destroy

    resources "/login", SessionController, only: [:create]
    resources "/my-account", AccountController, only: [:show], singleton: true
    resources "/churches", ChurchController
    resources "/pathways", PathwayController
    resources "/users", UserController
  end
end
