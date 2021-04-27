defmodule MngoAppBuilderWeb.DefaultController do
  use MngoAppBuilderWeb, :controller

  def index(conn, _params) do
    text conn, "Welcome to Constance. Personal desktop Network Monitor."
  end
end
