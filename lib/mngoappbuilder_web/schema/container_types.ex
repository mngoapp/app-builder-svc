defmodule MngoAppBuilderWeb.Schema.ContainerTypes do
  #use Absinthe.Schema

  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1, dataloader: 2]

  alias MngoAppBuilderWeb.ContainersResolver

  @desc "A container"
  object :container do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :type, non_null(:string)

    #field :schema, :schema, resolve: dataloader(Data)

    field :schemas, list_of(:schema),
      resolve: dataloader(MngoAppBuilderWeb.Data, :schemas)

  end

  object :container_queries do
    @desc "Get all Containers"
    field :all_containers, non_null(list_of(non_null(:container))) do 
        resolve(&ContainersResolver.list/3)
    end

    @desc "Get a specific Container"
    field :container, :container do
      arg(:id, non_null(:id))
      resolve(&ContainersResolver.show/3)
    end

  end
end