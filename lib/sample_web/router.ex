defmodule SampleWeb.Router do
  use SampleWeb, :router

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

  pipeline :assets do
    plug :accepts, ["css", "js"]
  end

  scope "/", SampleWeb do
    pipe_through :browser # Use the default browser stack
    get "/test/one", PageController, :test_one
    get "/test/two", PageController, :test_two
    get "/test/three", PageController, :test_three
    get "/test/four", PageController, :test_four
    get "/", PageController, :index
  end
  scope "/stylesheets", SampleWeb do
    pipe_through :assets # Use the default browser stack
    get "/demo.css", PageController, :demo_css
    get "/push.css", PageController, :push_css
  end

  # Other scopes may use custom stacks.
  # scope "/api", SampleWeb do
  #   pipe_through :api
  # end
end
