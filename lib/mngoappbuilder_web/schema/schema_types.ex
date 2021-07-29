defmodule MngoAppBuilderWeb.Schema.SchemaTypes do
  use Absinthe.Schema.Notation

  alias MngoAppBuilderWeb.SchemasResolver

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias SocializerWeb.{Data, Resolvers}

  @desc "A schema"
  object :schema do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :type, non_null(:string)

    field :container, :container, resolve: dataloader(Data)
  end

  #object :schema_queries do
    # @desc "Get all Containers"
    # field :all_containers, non_null(list_of(non_null(:container))) do 
    #     resolve(&ContainersResolver.all_containers/3)
    # end


  object :schema_queries do
    @desc "Get all schemas for a specific container"
    field :container_schemas, list_of(:schema) do
      arg(:container_id, non_null(:id))
      resolve(&SchemasResolver.list/3)
    end
  end
end