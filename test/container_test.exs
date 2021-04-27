# defmodule ContainersApiIntegrationTest do
#   use ExUnit.Case, async: true
#   use Plug.Test
#   alias ConstanceWeb.Router

#   @opts Router.init([])
#   test 'GET Containers' do
#     conn = conn(:get, "/api/containers")
#     response = Router.call(conn, @opts)
#     assert response.status == 200
#   end
# end
