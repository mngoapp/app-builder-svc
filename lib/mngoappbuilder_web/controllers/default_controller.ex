defmodule MngoAppBuilderWeb.DefaultController do
  use MngoAppBuilderWeb, :controller

  def index(conn, _params) do
    text conn, "Welcome to Mango Application Builder. An Application Platform."
  end
end
