defmodule Onwipca.Router do
  use Onwipca.Web, :router

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

  scope "/api", Onwipca do
    pipe_through :api

    resources "/churches", ChurchController, only: [:index]
  end

  scope "/", Onwipca do
    pipe_through :browser

    get "/", PageController, :index

    resources "/users", UserController

    get "/login", SessionController, :new
    resources "/login", SessionController, only: [:create, :delete]
  end

end
