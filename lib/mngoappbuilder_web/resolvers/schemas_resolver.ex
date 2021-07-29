defmodule MngoAppBuilderWeb.SchemasResolver do
    def list(_parent, args, _resolutions) do
        IO.inspect args[:container_id]
        container =
        args[:container_id]
        |> Builder.Model.Container.find()
        |> Builder.Repo.preload(:schemas)

        {:ok, container.schemas}
    end
end