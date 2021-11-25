defmodule MngoAppBuilderWeb.SystemColumnController do
  use MngoAppBuilderWeb, :controller
  action_fallback MngoAppBuilderWeb.FallbackController
  def get_all(conn,_key_params) do
    results = Core.SysColumn.get_all #GenServer.call(:container_gen_server,{:get_all})
    json conn |> put_status(:ok), results
  end

  # def update(conn,
  # %{
  #   "key" => key,
  #   "title" => title,
  #   "type" => type,
  # } = params) do
  #   GenServer.cast(:container_gen_server,{:update,key,title,type})
  #   send_resp(conn, :no_content, "")
  # end

  # def save(conn,
  # %{
  #   "title" => title,
  #   "type" => type
  # } = params) do
  #   GenServer.cast(:container_gen_server,{:save,title,type})
  #   json conn |> put_status(:created), params
  # end

  # def delete(conn,%{"key" => key_params}) do
  #   GenServer.cast(:container_gen_server,{:delete,key_params})
  #   send_resp(conn, :no_content, "")
  # end
end
