defmodule MngoAppBuilderWeb.Schema do
  use Absinthe.Schema

  alias MngoAppBuilderWeb.Data
  
  import_types(Absinthe.Type.Custom)
  import_types(MngoAppBuilderWeb.Schema.ContainerTypes)
  import_types(MngoAppBuilderWeb.Schema.SchemaTypes)
  
  query do
    import_fields(:container_queries)
    import_fields(:schema_queries)
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Data, Data.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

#   def middleware(middleware, _field, _object) do
#     [NewRelic.Absinthe.Middleware] ++ middleware
#   end
end
